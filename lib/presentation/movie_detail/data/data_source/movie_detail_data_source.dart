import 'package:door_stamp/environment/api_config.dart';
import 'package:door_stamp/presentation/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/movie_detail/data/models/movie_detail_request_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_detail_data_source.g.dart';

@module
abstract class MovieDetailDataSourceModule {
  @lazySingleton
  MovieDetailDataSource provideMovieDetailDataSource(Dio dio) {
    return MovieDetailDataSource(dio, baseUrl: ApiConfig.baseUrl);
  }
}

@RestApi()
abstract class MovieDetailDataSource {
  factory MovieDetailDataSource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _MovieDetailDataSource;

  @GET('movie/searchMovieInfo.json?')
  Future<MovieDetailResponseModel> getMovieDetail(
    @Queries() MovieDetailRequestModel movieDetailRequestModel,
  );
}
