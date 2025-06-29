// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_box_office_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyBoxOfficeRequestModel _$DailyBoxOfficeRequestModelFromJson(
  Map<String, dynamic> json,
) => _DailyBoxOfficeRequestModel(
  key: json['key'] as String,
  targetDt: json['targetDt'] as String,
  itemPerPage: json['itemPerPage'] as String?,
);

Map<String, dynamic> _$DailyBoxOfficeRequestModelToJson(
  _DailyBoxOfficeRequestModel instance,
) => <String, dynamic>{
  'key': instance.key,
  'targetDt': instance.targetDt,
  'itemPerPage': instance.itemPerPage,
};
