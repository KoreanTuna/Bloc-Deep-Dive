// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_box_office_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyBoxOfficeRequestModel {

/// 발급받은 키 값
 String get key;/// 조회하고자 하는 날짜 (yyyymmdd 형식)
 String get targetDt;/// 결과 ROW 의 개수 (default: "10", 최대: "10")
 String? get itemPerPage;
/// Create a copy of DailyBoxOfficeRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBoxOfficeRequestModelCopyWith<DailyBoxOfficeRequestModel> get copyWith => _$DailyBoxOfficeRequestModelCopyWithImpl<DailyBoxOfficeRequestModel>(this as DailyBoxOfficeRequestModel, _$identity);

  /// Serializes this DailyBoxOfficeRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBoxOfficeRequestModel&&(identical(other.key, key) || other.key == key)&&(identical(other.targetDt, targetDt) || other.targetDt == targetDt)&&(identical(other.itemPerPage, itemPerPage) || other.itemPerPage == itemPerPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,targetDt,itemPerPage);

@override
String toString() {
  return 'DailyBoxOfficeRequestModel(key: $key, targetDt: $targetDt, itemPerPage: $itemPerPage)';
}


}

/// @nodoc
abstract mixin class $DailyBoxOfficeRequestModelCopyWith<$Res>  {
  factory $DailyBoxOfficeRequestModelCopyWith(DailyBoxOfficeRequestModel value, $Res Function(DailyBoxOfficeRequestModel) _then) = _$DailyBoxOfficeRequestModelCopyWithImpl;
@useResult
$Res call({
 String key, String targetDt, String? itemPerPage
});




}
/// @nodoc
class _$DailyBoxOfficeRequestModelCopyWithImpl<$Res>
    implements $DailyBoxOfficeRequestModelCopyWith<$Res> {
  _$DailyBoxOfficeRequestModelCopyWithImpl(this._self, this._then);

  final DailyBoxOfficeRequestModel _self;
  final $Res Function(DailyBoxOfficeRequestModel) _then;

/// Create a copy of DailyBoxOfficeRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? targetDt = null,Object? itemPerPage = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,targetDt: null == targetDt ? _self.targetDt : targetDt // ignore: cast_nullable_to_non_nullable
as String,itemPerPage: freezed == itemPerPage ? _self.itemPerPage : itemPerPage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DailyBoxOfficeRequestModel implements DailyBoxOfficeRequestModel {
  const _DailyBoxOfficeRequestModel({required this.key, required this.targetDt, this.itemPerPage});
  factory _DailyBoxOfficeRequestModel.fromJson(Map<String, dynamic> json) => _$DailyBoxOfficeRequestModelFromJson(json);

/// 발급받은 키 값
@override final  String key;
/// 조회하고자 하는 날짜 (yyyymmdd 형식)
@override final  String targetDt;
/// 결과 ROW 의 개수 (default: "10", 최대: "10")
@override final  String? itemPerPage;

/// Create a copy of DailyBoxOfficeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBoxOfficeRequestModelCopyWith<_DailyBoxOfficeRequestModel> get copyWith => __$DailyBoxOfficeRequestModelCopyWithImpl<_DailyBoxOfficeRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBoxOfficeRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBoxOfficeRequestModel&&(identical(other.key, key) || other.key == key)&&(identical(other.targetDt, targetDt) || other.targetDt == targetDt)&&(identical(other.itemPerPage, itemPerPage) || other.itemPerPage == itemPerPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,targetDt,itemPerPage);

@override
String toString() {
  return 'DailyBoxOfficeRequestModel(key: $key, targetDt: $targetDt, itemPerPage: $itemPerPage)';
}


}

/// @nodoc
abstract mixin class _$DailyBoxOfficeRequestModelCopyWith<$Res> implements $DailyBoxOfficeRequestModelCopyWith<$Res> {
  factory _$DailyBoxOfficeRequestModelCopyWith(_DailyBoxOfficeRequestModel value, $Res Function(_DailyBoxOfficeRequestModel) _then) = __$DailyBoxOfficeRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String targetDt, String? itemPerPage
});




}
/// @nodoc
class __$DailyBoxOfficeRequestModelCopyWithImpl<$Res>
    implements _$DailyBoxOfficeRequestModelCopyWith<$Res> {
  __$DailyBoxOfficeRequestModelCopyWithImpl(this._self, this._then);

  final _DailyBoxOfficeRequestModel _self;
  final $Res Function(_DailyBoxOfficeRequestModel) _then;

/// Create a copy of DailyBoxOfficeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? targetDt = null,Object? itemPerPage = freezed,}) {
  return _then(_DailyBoxOfficeRequestModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,targetDt: null == targetDt ? _self.targetDt : targetDt // ignore: cast_nullable_to_non_nullable
as String,itemPerPage: freezed == itemPerPage ? _self.itemPerPage : itemPerPage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
