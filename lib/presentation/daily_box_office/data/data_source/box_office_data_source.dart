import 'package:bloc_deep_dive/presentation/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:bloc_deep_dive/presentation/daily_box_office/data/models/daily_box_office_request_model.dart';
import 'package:bloc_deep_dive/environment/api_config.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'box_office_data_source.g.dart';

@module
abstract class BoxOfficeDataSourceModule {
  @lazySingleton
  BoxOfficeDataSource provideBoxOfficeDataSource(Dio dio) {
    return BoxOfficeDataSource(dio, baseUrl: ApiConfig.baseUrl);
  }
}

@RestApi()
abstract class BoxOfficeDataSource {
  factory BoxOfficeDataSource(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _BoxOfficeDataSource;

  @GET('boxoffice/searchDailyBoxOfficeList.json?')
  Future<BoxOfficeResponseModel> getDailyBoxOffice(
    @Queries() DailyBoxOfficeRequestModel dailyBoxOfficeRequestModel,
  );
}
