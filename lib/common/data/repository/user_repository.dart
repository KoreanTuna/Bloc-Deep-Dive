import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:door_stamp/common/constant/firestore/firestore_path.dart';
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/util/local_storage/shared_pref_util.dart';
import 'package:door_stamp/util/result.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository {
  UserRepository(
    this._sharedPrefUtil,
    this._firestoreDataSource,
  );
  final SharedPrefUtil _sharedPrefUtil;
  final FirestoreDataSource _firestoreDataSource;
  UserModel? _user;

  Future<Result<bool>> isUserExists(String uid) async {
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
    /// 사용자 데이터가 FireStore에 존재하는지 확인
    final Result<bool> userExists = await isUserExists(user.id);

    try {
      /// 사용자 데이터가 존재하면 업데이트, 존재하지 않으면 추가
      if (userExists is Ok<bool> && userExists.value) {
        await _firestoreDataSource.setData(
          path: FirestorePath.userCollection,
          args: user.toJson(),
        );
      } else {
        await _firestoreDataSource.addData(
          collectionPath: FirestorePath.userCollection,
          docId: user.id,
          args:
              user
                  .copyWith(
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  )
                  .toJson(),
        );
      }
    } catch (e) {
      return Result.error(Exception('Failed to set user data: $e'));
    }

    return Result.ok(null);
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
  }

  Future<Result<UserModel>> getUser(String userId) async {
    if (_user != null) return Result.ok(_user!);

    try {
      final DocumentReference userDocRef = _firestoreDataSource.getDoc(
        path: FirestorePath.userCollection,
        docId: userId,
      );
      final snapshot = await userDocRef.get();
      if (snapshot.exists) {
        final user = UserModel.fromJson(
          snapshot.data() as Map<String, dynamic>,
        );
        _user = user;
        return Result.ok(user);
      } else {
        return Result.error(Exception('User not found'));
      }
    } catch (e) {
      return Result.error(Exception('Failed to get user: $e'));
    }
  }

  String getCurrentUserId() {
    return _user?.id ?? '';
  }
}
