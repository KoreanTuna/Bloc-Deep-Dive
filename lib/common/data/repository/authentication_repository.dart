import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:door_stamp/common/constant/firestore/firestore_path.dart';
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/util/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository({required FirestoreDataSource firestoreDataSource})
    : _firestoreDataSource = firestoreDataSource;

  final _controller = StreamController<AuthenticationStatus>();

  final FirestoreDataSource _firestoreDataSource;

  Future<Result<bool>> _isUserExists(String uid) async {
    final DocumentReference userDoc = _firestoreDataSource.getDoc(
      path: FirestorePath.userCollection,
      docId: uid,
    );
    final snapshot = await userDoc.get();
    if (!snapshot.exists) {
      return Result.ok(false);
    }

    return Result.ok(true);
  }

  Future<Result<void>> setUserData(UserModel user) async {
    final DocumentReference userDocRef = _firestoreDataSource.getDoc(
      path: FirestorePath.userCollection,
      docId: user.id,
    );

    /// 사용자 데이터가 FireStore에 존재하는지 확인
    final Result<bool> userExists = await _isUserExists(user.id);

    try {
      /// 사용자 데이터가 존재하면 업데이트, 존재하지 않으면 추가
      if (userExists is Ok<bool> && userExists.value) {
        await _firestoreDataSource.setData(
          path: userDocRef.path,
          args: user.toJson(),
        );
      } else {
        await _firestoreDataSource.addData(
          path: userDocRef.path,
          args: user.toJson(),
        );
      }
    } catch (e) {
      return Result.error(Exception('Failed to set user data: $e'));
    }

    return Result.ok(null);
  }

  Future<Result<UserCredential>> signInWithGoogle() async {
    try {
      /// GoogleSignin 객체 초기화
      await GoogleSignIn.instance.initialize();

      /// Google Sign-In 인증 요청
      final GoogleSignInAccount account =
          await GoogleSignIn.instance.authenticate();

      ///
      GoogleSignInAuthorizationClient googleSignInClientAuthorization =
          GoogleSignIn.instance.authorizationClient;

      /// Google Sign-In 클라이언트 권한 요청
      final GoogleSignInClientAuthorization? client =
          await googleSignInClientAuthorization.authorizationForScopes(
            ['email', 'profile'],
          );

      if (client == null) {
        return Result.error(Exception('GoogleSignIn client가 존재하지 않습니다.'));
      }

      final GoogleSignInAuthentication googleAuth = account.authentication;

      /// OAuthCredential 생성
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: client.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        /// Firebase에 사용자 인증
        final UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(credential);
        _controller.add(AuthenticationStatus.authenticated);
        return Result.ok(userCredential);
      } catch (error) {
        _controller.add(AuthenticationStatus.unauthenticated);
        return Result.error(Exception('Sign-in failed: $error'));
      }
    } catch (e) {
      return Result.error(Exception('Google Sign-In failed: $e'));
    }
  }

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
