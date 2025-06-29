import 'package:bloc_deep_dive/common/data/models/box_office/daily_box_office_model.dart';
import 'package:bloc_deep_dive/common/data/models/box_office/daily_box_office_request_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'box_office_data_source.g.dart';

@module
abstract class BoxOfficeDataSourceModule {
  @lazySingleton
  BoxOfficeDataSource provideBoxOfficeDataSource(Dio dio, String baseUrl) {
    return BoxOfficeDataSource(dio, baseUrl: baseUrl);
  }
}

@RestApi()
abstract class BoxOfficeDataSource {
  factory BoxOfficeDataSource(Dio dio, {String baseUrl}) = _BoxOfficeDataSource;

  @GET('boxoffice/searchDailyBoxOfficeList.json?')
  Future<DailyBoxOfficeModel> getDailyBoxOffice(
    @Queries() DailyBoxOfficeRequestModel dailyBoxOfficeRequestModel,
  );
}
