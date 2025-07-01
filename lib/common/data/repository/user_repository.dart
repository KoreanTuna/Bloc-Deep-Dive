import 'dart:async';

import 'package:bloc_deep_dive/common/constant/shared_pref_key.dart';
import 'package:bloc_deep_dive/common/data/models/user.dart';
import 'package:bloc_deep_dive/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:bloc_deep_dive/util/local_storage/shared_pref_util.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  UserRepository(this._sharedPrefUtil);
  final SharedPrefUtil _sharedPrefUtil;

  User? _user;

  Future<void> saveFavoriteGenres(List<FavoriteGenre> favoriteGenres) async {
    if (_user == null) return;
    _user = _user!.copyWith(favoriteGenres: favoriteGenres);

    await _sharedPrefUtil.setStringList(
      key: SharedPrefKey.favoriteGenre,
      value: favoriteGenres.map((e) => e.name).toList(),
    );
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    List<String>? favoriteGenres = _sharedPrefUtil.getStringList(
      SharedPrefKey.favoriteGenre,
    );

    if (favoriteGenres == null || favoriteGenres.isEmpty) {
      favoriteGenres = [];
    }

    return Future.delayed(
      Duration(milliseconds: 300),
      () =>
          _user = User(
            id: Uuid().v4(),
            name: 'Minwoo',
            favoriteGenres:
                favoriteGenres!
                    .map(
                      (genre) => FavoriteGenre.values.firstWhere(
                        (e) => e.name == genre,
                      ),
                    )
                    .toList(),
          ),
    );
  }
}
