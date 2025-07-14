import 'package:door_stamp/common/constant/firestore/firestore_path.dart';
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart';
import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/util/result.dart';

class FavoriteGenreRepository {
  FavoriteGenreRepository(
    this._firestoreDataSource,
    this._userRepository,
  );

  final FirestoreDataSource _firestoreDataSource;
  final UserRepository _userRepository;

  /// 선호하는 장르 저장
  Future<Result<void>> saveFavoriteGenres({
    required List<FavoriteGenre> favoriteGenres,
  }) async {
    final String userId = _userRepository.getCurrentUserId();
    if (userId.isEmpty) {
      return Result.error(Exception('사용자 정보를 찾을 수 없습니다'));
    }

    final List<String> favoriteGenresData =
        favoriteGenres.map((genre) => genre.value).toList();

    final Result<void> saveResult = await _firestoreDataSource.setData(
      path: '${FirestorePath.userCollection}/$userId',
      args: {
        'favoriteGenres': favoriteGenresData,
      },
    );

    return saveResult;
  }
}
