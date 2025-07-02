import 'dart:async';

import 'package:door_stamp/common/constant/shared_pref_key.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/util/local_storage/shared_pref_util.dart';

class UserRepository {
  UserRepository(this._sharedPrefUtil);
  final SharedPrefUtil _sharedPrefUtil;

  UserModel? _user;

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

  Future<UserModel?> getUser() async {
    if (_user != null) return _user;
    List<String>? favoriteGenres = _sharedPrefUtil.getStringList(
      SharedPrefKey.favoriteGenre,
    );

    if (favoriteGenres == null || favoriteGenres.isEmpty) {
      favoriteGenres = [];
    }
    return _user;
  }
}
