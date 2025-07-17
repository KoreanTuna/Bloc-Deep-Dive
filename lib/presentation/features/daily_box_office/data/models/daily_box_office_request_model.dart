import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_box_office_request_model.g.dart';
part 'daily_box_office_request_model.freezed.dart';

@freezed
abstract class DailyBoxOfficeRequestModel with _$DailyBoxOfficeRequestModel {
  const factory DailyBoxOfficeRequestModel({
    /// 발급받은 키 값
    required String key,

    /// 조회하고자 하는 날짜 (yyyymmdd 형식)
    required String targetDt,

    /// 결과 ROW 의 개수 (default: "10", 최대: "10")
    String? itemPerPage,
  }) = _DailyBoxOfficeRequestModel;

  factory DailyBoxOfficeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DailyBoxOfficeRequestModelFromJson(json);
}
