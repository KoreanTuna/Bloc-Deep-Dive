import 'package:door_stamp/presentation/features/daily_box_office/data/data_source/box_office_data_source.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_request_model.dart';
import 'package:door_stamp/environment/api_config.dart';
import 'package:door_stamp/util/result.dart';
import 'package:injectable/injectable.dart';

@singleton
class BoxOfficeRepository {
  BoxOfficeRepository(this._boxOfficeDataSource);
  final BoxOfficeDataSource _boxOfficeDataSource;

  DailyBoxOfficeModel? _cachedBoxOfficeModel;

  Future<Result<DailyBoxOfficeModel>> getDailyBoxOffice({
    required String targetDt,
    String? itemPerPage,
    bool isRefresh = false,
  }) async {
    if (!isRefresh && _cachedBoxOfficeModel != null) {
      return Result.ok(_cachedBoxOfficeModel!);
    }

    try {
      final BoxOfficeResponseModel response = await _boxOfficeDataSource
          .getDailyBoxOffice(
            DailyBoxOfficeRequestModel(
              key: ApiConfig.apiKey,
              targetDt: targetDt,
              itemPerPage: itemPerPage,
            ),
          );

      _cachedBoxOfficeModel = response.boxOfficeResult;
      return Result.ok(response.boxOfficeResult);
    } catch (e) {
      return Result.error(
        Exception('Failed to fetch daily box office data: $e'),
      );
    }
  }
}
