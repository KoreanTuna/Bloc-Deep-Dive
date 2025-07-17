// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailRequestModel {

/// 발급받은키
 String get key;/// 영화코드
 String get movieCd;
/// Create a copy of MovieDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailRequestModelCopyWith<MovieDetailRequestModel> get copyWith => _$MovieDetailRequestModelCopyWithImpl<MovieDetailRequestModel>(this as MovieDetailRequestModel, _$identity);

  /// Serializes this MovieDetailRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailRequestModel&&(identical(other.key, key) || other.key == key)&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,movieCd);

@override
String toString() {
  return 'MovieDetailRequestModel(key: $key, movieCd: $movieCd)';
}


}

/// @nodoc
abstract mixin class $MovieDetailRequestModelCopyWith<$Res>  {
  factory $MovieDetailRequestModelCopyWith(MovieDetailRequestModel value, $Res Function(MovieDetailRequestModel) _then) = _$MovieDetailRequestModelCopyWithImpl;
@useResult
$Res call({
 String key, String movieCd
});




}
/// @nodoc
class _$MovieDetailRequestModelCopyWithImpl<$Res>
    implements $MovieDetailRequestModelCopyWith<$Res> {
  _$MovieDetailRequestModelCopyWithImpl(this._self, this._then);

  final MovieDetailRequestModel _self;
  final $Res Function(MovieDetailRequestModel) _then;

/// Create a copy of MovieDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? movieCd = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,movieCd: null == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieDetailRequestModel implements MovieDetailRequestModel {
   _MovieDetailRequestModel({required this.key, required this.movieCd});
  factory _MovieDetailRequestModel.fromJson(Map<String, dynamic> json) => _$MovieDetailRequestModelFromJson(json);

/// 발급받은키
@override final  String key;
/// 영화코드
@override final  String movieCd;

/// Create a copy of MovieDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailRequestModelCopyWith<_MovieDetailRequestModel> get copyWith => __$MovieDetailRequestModelCopyWithImpl<_MovieDetailRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailRequestModel&&(identical(other.key, key) || other.key == key)&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,movieCd);

@override
String toString() {
  return 'MovieDetailRequestModel(key: $key, movieCd: $movieCd)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailRequestModelCopyWith<$Res> implements $MovieDetailRequestModelCopyWith<$Res> {
  factory _$MovieDetailRequestModelCopyWith(_MovieDetailRequestModel value, $Res Function(_MovieDetailRequestModel) _then) = __$MovieDetailRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String movieCd
});




}
/// @nodoc
class __$MovieDetailRequestModelCopyWithImpl<$Res>
    implements _$MovieDetailRequestModelCopyWith<$Res> {
  __$MovieDetailRequestModelCopyWithImpl(this._self, this._then);

  final _MovieDetailRequestModel _self;
  final $Res Function(_MovieDetailRequestModel) _then;

/// Create a copy of MovieDetailRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? movieCd = null,}) {
  return _then(_MovieDetailRequestModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,movieCd: null == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
