import 'dart:async';

import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/core/util/logger.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(this._userRepository) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        _controller.add(AuthenticationStatus.unauthenticated);
      } else {
        final Result<void> result = await _userRepository.getUser(user.uid);
        result.when(
          ok: (_) {
            logger.d('사용자 정보 조회 성공: ${user.uid}');
            _controller.add(AuthenticationStatus.authenticated);
          },
          error: (Exception e) {
            logger.e('사용자 정보 조회 실패: ${e.toString()}');
            _controller.add(AuthenticationStatus.unauthenticated);
          },
        );
      }
    });
  }

  final UserRepository _userRepository;
  final _controller = StreamController<AuthenticationStatus>();

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
    yield* _controller.stream;
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
