import 'package:door_stamp/environment/api_config.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/data_source/movie_detail_data_source.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_request_model.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieDetailRepository {
  MovieDetailRepository(this._movieDetailDataSource);

  final MovieDetailDataSource _movieDetailDataSource;

  MovieDetailModel? _cachedMovieDetail;

  /// 영화 상세 정보 조회
  Future<Result<MovieDetailModel>> getMovieDetail({
    required String movieCd,
    bool forceRefresh = false,
  }) async {
    // 캐시된 데이터가 있고, 강제 새로고침이 필요하지 않으면 캐시된 데이터를 반환
    if (!forceRefresh &&
        _cachedMovieDetail != null &&
        _cachedMovieDetail!.movieInfo.movieCd == movieCd) {
      return Result.ok(_cachedMovieDetail!);
    }

    try {
      final MovieDetailResponseModel response = await _movieDetailDataSource
          .getMovieDetail(
            MovieDetailRequestModel(
              key: ApiConfig.apiKey,
              movieCd: movieCd,
            ),
          );
      _cachedMovieDetail = response.movieInfoResult;
      return Result.ok(response.movieInfoResult);
    } catch (e) {
      return Result.error(Exception('Failed to fetch movie details: $e'));
    }
  }
}
