import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:door_stamp/common/constant/firestore/firestore_path.dart';
import 'package:door_stamp/common/constant/shared_pref_key.dart';
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/util/local_storage/shared_pref_util.dart';
import 'package:door_stamp/util/result.dart';

class UserRepository {
  UserRepository(
    this._sharedPrefUtil,
    this._firestoreDataSource,
  );
  final SharedPrefUtil _sharedPrefUtil;
  final FirestoreDataSource _firestoreDataSource;
  UserModel? _user;

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

  Future<void> saveFavoriteGenres(List<FavoriteGenre> favoriteGenres) async {
    if (_user == null) return;
    _user = _user!.copyWith(favoriteGenres: favoriteGenres);

    await _sharedPrefUtil.setStringList(
      key: SharedPrefKey.favoriteGenre,
      value: favoriteGenres.map((e) => e.name).toList(),
    );
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
  }

  Future<Result<UserModel>> getUser(String userId) async {
    if (_user != null) return Result.ok(_user!);
    List<String>? favoriteGenres = _sharedPrefUtil.getStringList(
      SharedPrefKey.favoriteGenre,
    );

    if (favoriteGenres == null || favoriteGenres.isEmpty) {
      favoriteGenres = [];
    }
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
}
