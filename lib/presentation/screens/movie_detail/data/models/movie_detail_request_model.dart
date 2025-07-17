import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_detail_request_model.g.dart';
part 'movie_detail_request_model.freezed.dart';

@freezed
abstract class MovieDetailRequestModel with _$MovieDetailRequestModel {
  factory MovieDetailRequestModel({
    /// 발급받은키
    required String key,

    /// 영화코드
    required String movieCd,
  }) = _MovieDetailRequestModel;

  factory MovieDetailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailRequestModelFromJson(json);
}
