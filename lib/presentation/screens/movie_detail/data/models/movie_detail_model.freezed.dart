// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieDetailResponseModel {

 MovieDetailModel get movieInfoResult;
/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailResponseModelCopyWith<MovieDetailResponseModel> get copyWith => _$MovieDetailResponseModelCopyWithImpl<MovieDetailResponseModel>(this as MovieDetailResponseModel, _$identity);

  /// Serializes this MovieDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailResponseModel&&(identical(other.movieInfoResult, movieInfoResult) || other.movieInfoResult == movieInfoResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieInfoResult);

@override
String toString() {
  return 'MovieDetailResponseModel(movieInfoResult: $movieInfoResult)';
}


}

/// @nodoc
abstract mixin class $MovieDetailResponseModelCopyWith<$Res>  {
  factory $MovieDetailResponseModelCopyWith(MovieDetailResponseModel value, $Res Function(MovieDetailResponseModel) _then) = _$MovieDetailResponseModelCopyWithImpl;
@useResult
$Res call({
 MovieDetailModel movieInfoResult
});


$MovieDetailModelCopyWith<$Res> get movieInfoResult;

}
/// @nodoc
class _$MovieDetailResponseModelCopyWithImpl<$Res>
    implements $MovieDetailResponseModelCopyWith<$Res> {
  _$MovieDetailResponseModelCopyWithImpl(this._self, this._then);

  final MovieDetailResponseModel _self;
  final $Res Function(MovieDetailResponseModel) _then;

/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieInfoResult = null,}) {
  return _then(_self.copyWith(
movieInfoResult: null == movieInfoResult ? _self.movieInfoResult : movieInfoResult // ignore: cast_nullable_to_non_nullable
as MovieDetailModel,
  ));
}
/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailModelCopyWith<$Res> get movieInfoResult {
  
  return $MovieDetailModelCopyWith<$Res>(_self.movieInfoResult, (value) {
    return _then(_self.copyWith(movieInfoResult: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MovieDetailResponseModel implements MovieDetailResponseModel {
   _MovieDetailResponseModel({required this.movieInfoResult});
  factory _MovieDetailResponseModel.fromJson(Map<String, dynamic> json) => _$MovieDetailResponseModelFromJson(json);

@override final  MovieDetailModel movieInfoResult;

/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailResponseModelCopyWith<_MovieDetailResponseModel> get copyWith => __$MovieDetailResponseModelCopyWithImpl<_MovieDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailResponseModel&&(identical(other.movieInfoResult, movieInfoResult) || other.movieInfoResult == movieInfoResult));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieInfoResult);

@override
String toString() {
  return 'MovieDetailResponseModel(movieInfoResult: $movieInfoResult)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailResponseModelCopyWith<$Res> implements $MovieDetailResponseModelCopyWith<$Res> {
  factory _$MovieDetailResponseModelCopyWith(_MovieDetailResponseModel value, $Res Function(_MovieDetailResponseModel) _then) = __$MovieDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 MovieDetailModel movieInfoResult
});


@override $MovieDetailModelCopyWith<$Res> get movieInfoResult;

}
/// @nodoc
class __$MovieDetailResponseModelCopyWithImpl<$Res>
    implements _$MovieDetailResponseModelCopyWith<$Res> {
  __$MovieDetailResponseModelCopyWithImpl(this._self, this._then);

  final _MovieDetailResponseModel _self;
  final $Res Function(_MovieDetailResponseModel) _then;

/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieInfoResult = null,}) {
  return _then(_MovieDetailResponseModel(
movieInfoResult: null == movieInfoResult ? _self.movieInfoResult : movieInfoResult // ignore: cast_nullable_to_non_nullable
as MovieDetailModel,
  ));
}

/// Create a copy of MovieDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailModelCopyWith<$Res> get movieInfoResult {
  
  return $MovieDetailModelCopyWith<$Res>(_self.movieInfoResult, (value) {
    return _then(_self.copyWith(movieInfoResult: value));
  });
}
}


/// @nodoc
mixin _$MovieDetailInfoModel {

 String get movieCd; String get movieNm; String get movieNmEn; String get movieNmOg; String get showTm; String get prdtYear; String get openDt; String get prdtStatNm; String get typeNm; List<NationModel> get nations; List<GenreModel> get genres; List<PeopleModel> get directors; List<PeopleModel> get actors; List<ShowTypeModel> get showTypes; List<CompanyModel> get companys; List<AuditModel> get audits; List<StaffModel> get staffs;
/// Create a copy of MovieDetailInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailInfoModelCopyWith<MovieDetailInfoModel> get copyWith => _$MovieDetailInfoModelCopyWithImpl<MovieDetailInfoModel>(this as MovieDetailInfoModel, _$identity);

  /// Serializes this MovieDetailInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailInfoModel&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd)&&(identical(other.movieNm, movieNm) || other.movieNm == movieNm)&&(identical(other.movieNmEn, movieNmEn) || other.movieNmEn == movieNmEn)&&(identical(other.movieNmOg, movieNmOg) || other.movieNmOg == movieNmOg)&&(identical(other.showTm, showTm) || other.showTm == showTm)&&(identical(other.prdtYear, prdtYear) || other.prdtYear == prdtYear)&&(identical(other.openDt, openDt) || other.openDt == openDt)&&(identical(other.prdtStatNm, prdtStatNm) || other.prdtStatNm == prdtStatNm)&&(identical(other.typeNm, typeNm) || other.typeNm == typeNm)&&const DeepCollectionEquality().equals(other.nations, nations)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.directors, directors)&&const DeepCollectionEquality().equals(other.actors, actors)&&const DeepCollectionEquality().equals(other.showTypes, showTypes)&&const DeepCollectionEquality().equals(other.companys, companys)&&const DeepCollectionEquality().equals(other.audits, audits)&&const DeepCollectionEquality().equals(other.staffs, staffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieCd,movieNm,movieNmEn,movieNmOg,showTm,prdtYear,openDt,prdtStatNm,typeNm,const DeepCollectionEquality().hash(nations),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(directors),const DeepCollectionEquality().hash(actors),const DeepCollectionEquality().hash(showTypes),const DeepCollectionEquality().hash(companys),const DeepCollectionEquality().hash(audits),const DeepCollectionEquality().hash(staffs));

@override
String toString() {
  return 'MovieDetailInfoModel(movieCd: $movieCd, movieNm: $movieNm, movieNmEn: $movieNmEn, movieNmOg: $movieNmOg, showTm: $showTm, prdtYear: $prdtYear, openDt: $openDt, prdtStatNm: $prdtStatNm, typeNm: $typeNm, nations: $nations, genres: $genres, directors: $directors, actors: $actors, showTypes: $showTypes, companys: $companys, audits: $audits, staffs: $staffs)';
}


}

/// @nodoc
abstract mixin class $MovieDetailInfoModelCopyWith<$Res>  {
  factory $MovieDetailInfoModelCopyWith(MovieDetailInfoModel value, $Res Function(MovieDetailInfoModel) _then) = _$MovieDetailInfoModelCopyWithImpl;
@useResult
$Res call({
 String movieCd, String movieNm, String movieNmEn, String movieNmOg, String showTm, String prdtYear, String openDt, String prdtStatNm, String typeNm, List<NationModel> nations, List<GenreModel> genres, List<PeopleModel> directors, List<PeopleModel> actors, List<ShowTypeModel> showTypes, List<CompanyModel> companys, List<AuditModel> audits, List<StaffModel> staffs
});




}
/// @nodoc
class _$MovieDetailInfoModelCopyWithImpl<$Res>
    implements $MovieDetailInfoModelCopyWith<$Res> {
  _$MovieDetailInfoModelCopyWithImpl(this._self, this._then);

  final MovieDetailInfoModel _self;
  final $Res Function(MovieDetailInfoModel) _then;

/// Create a copy of MovieDetailInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieCd = null,Object? movieNm = null,Object? movieNmEn = null,Object? movieNmOg = null,Object? showTm = null,Object? prdtYear = null,Object? openDt = null,Object? prdtStatNm = null,Object? typeNm = null,Object? nations = null,Object? genres = null,Object? directors = null,Object? actors = null,Object? showTypes = null,Object? companys = null,Object? audits = null,Object? staffs = null,}) {
  return _then(_self.copyWith(
movieCd: null == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String,movieNm: null == movieNm ? _self.movieNm : movieNm // ignore: cast_nullable_to_non_nullable
as String,movieNmEn: null == movieNmEn ? _self.movieNmEn : movieNmEn // ignore: cast_nullable_to_non_nullable
as String,movieNmOg: null == movieNmOg ? _self.movieNmOg : movieNmOg // ignore: cast_nullable_to_non_nullable
as String,showTm: null == showTm ? _self.showTm : showTm // ignore: cast_nullable_to_non_nullable
as String,prdtYear: null == prdtYear ? _self.prdtYear : prdtYear // ignore: cast_nullable_to_non_nullable
as String,openDt: null == openDt ? _self.openDt : openDt // ignore: cast_nullable_to_non_nullable
as String,prdtStatNm: null == prdtStatNm ? _self.prdtStatNm : prdtStatNm // ignore: cast_nullable_to_non_nullable
as String,typeNm: null == typeNm ? _self.typeNm : typeNm // ignore: cast_nullable_to_non_nullable
as String,nations: null == nations ? _self.nations : nations // ignore: cast_nullable_to_non_nullable
as List<NationModel>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,directors: null == directors ? _self.directors : directors // ignore: cast_nullable_to_non_nullable
as List<PeopleModel>,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<PeopleModel>,showTypes: null == showTypes ? _self.showTypes : showTypes // ignore: cast_nullable_to_non_nullable
as List<ShowTypeModel>,companys: null == companys ? _self.companys : companys // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,audits: null == audits ? _self.audits : audits // ignore: cast_nullable_to_non_nullable
as List<AuditModel>,staffs: null == staffs ? _self.staffs : staffs // ignore: cast_nullable_to_non_nullable
as List<StaffModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieDetailInfoModel implements MovieDetailInfoModel {
   _MovieDetailInfoModel({required this.movieCd, required this.movieNm, required this.movieNmEn, required this.movieNmOg, required this.showTm, required this.prdtYear, required this.openDt, required this.prdtStatNm, required this.typeNm, required final  List<NationModel> nations, required final  List<GenreModel> genres, required final  List<PeopleModel> directors, required final  List<PeopleModel> actors, required final  List<ShowTypeModel> showTypes, required final  List<CompanyModel> companys, required final  List<AuditModel> audits, required final  List<StaffModel> staffs}): _nations = nations,_genres = genres,_directors = directors,_actors = actors,_showTypes = showTypes,_companys = companys,_audits = audits,_staffs = staffs;
  factory _MovieDetailInfoModel.fromJson(Map<String, dynamic> json) => _$MovieDetailInfoModelFromJson(json);

@override final  String movieCd;
@override final  String movieNm;
@override final  String movieNmEn;
@override final  String movieNmOg;
@override final  String showTm;
@override final  String prdtYear;
@override final  String openDt;
@override final  String prdtStatNm;
@override final  String typeNm;
 final  List<NationModel> _nations;
@override List<NationModel> get nations {
  if (_nations is EqualUnmodifiableListView) return _nations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nations);
}

 final  List<GenreModel> _genres;
@override List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<PeopleModel> _directors;
@override List<PeopleModel> get directors {
  if (_directors is EqualUnmodifiableListView) return _directors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directors);
}

 final  List<PeopleModel> _actors;
@override List<PeopleModel> get actors {
  if (_actors is EqualUnmodifiableListView) return _actors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actors);
}

 final  List<ShowTypeModel> _showTypes;
@override List<ShowTypeModel> get showTypes {
  if (_showTypes is EqualUnmodifiableListView) return _showTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_showTypes);
}

 final  List<CompanyModel> _companys;
@override List<CompanyModel> get companys {
  if (_companys is EqualUnmodifiableListView) return _companys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companys);
}

 final  List<AuditModel> _audits;
@override List<AuditModel> get audits {
  if (_audits is EqualUnmodifiableListView) return _audits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audits);
}

 final  List<StaffModel> _staffs;
@override List<StaffModel> get staffs {
  if (_staffs is EqualUnmodifiableListView) return _staffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffs);
}


/// Create a copy of MovieDetailInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailInfoModelCopyWith<_MovieDetailInfoModel> get copyWith => __$MovieDetailInfoModelCopyWithImpl<_MovieDetailInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailInfoModel&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd)&&(identical(other.movieNm, movieNm) || other.movieNm == movieNm)&&(identical(other.movieNmEn, movieNmEn) || other.movieNmEn == movieNmEn)&&(identical(other.movieNmOg, movieNmOg) || other.movieNmOg == movieNmOg)&&(identical(other.showTm, showTm) || other.showTm == showTm)&&(identical(other.prdtYear, prdtYear) || other.prdtYear == prdtYear)&&(identical(other.openDt, openDt) || other.openDt == openDt)&&(identical(other.prdtStatNm, prdtStatNm) || other.prdtStatNm == prdtStatNm)&&(identical(other.typeNm, typeNm) || other.typeNm == typeNm)&&const DeepCollectionEquality().equals(other._nations, _nations)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._directors, _directors)&&const DeepCollectionEquality().equals(other._actors, _actors)&&const DeepCollectionEquality().equals(other._showTypes, _showTypes)&&const DeepCollectionEquality().equals(other._companys, _companys)&&const DeepCollectionEquality().equals(other._audits, _audits)&&const DeepCollectionEquality().equals(other._staffs, _staffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieCd,movieNm,movieNmEn,movieNmOg,showTm,prdtYear,openDt,prdtStatNm,typeNm,const DeepCollectionEquality().hash(_nations),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_directors),const DeepCollectionEquality().hash(_actors),const DeepCollectionEquality().hash(_showTypes),const DeepCollectionEquality().hash(_companys),const DeepCollectionEquality().hash(_audits),const DeepCollectionEquality().hash(_staffs));

@override
String toString() {
  return 'MovieDetailInfoModel(movieCd: $movieCd, movieNm: $movieNm, movieNmEn: $movieNmEn, movieNmOg: $movieNmOg, showTm: $showTm, prdtYear: $prdtYear, openDt: $openDt, prdtStatNm: $prdtStatNm, typeNm: $typeNm, nations: $nations, genres: $genres, directors: $directors, actors: $actors, showTypes: $showTypes, companys: $companys, audits: $audits, staffs: $staffs)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailInfoModelCopyWith<$Res> implements $MovieDetailInfoModelCopyWith<$Res> {
  factory _$MovieDetailInfoModelCopyWith(_MovieDetailInfoModel value, $Res Function(_MovieDetailInfoModel) _then) = __$MovieDetailInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String movieCd, String movieNm, String movieNmEn, String movieNmOg, String showTm, String prdtYear, String openDt, String prdtStatNm, String typeNm, List<NationModel> nations, List<GenreModel> genres, List<PeopleModel> directors, List<PeopleModel> actors, List<ShowTypeModel> showTypes, List<CompanyModel> companys, List<AuditModel> audits, List<StaffModel> staffs
});




}
/// @nodoc
class __$MovieDetailInfoModelCopyWithImpl<$Res>
    implements _$MovieDetailInfoModelCopyWith<$Res> {
  __$MovieDetailInfoModelCopyWithImpl(this._self, this._then);

  final _MovieDetailInfoModel _self;
  final $Res Function(_MovieDetailInfoModel) _then;

/// Create a copy of MovieDetailInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieCd = null,Object? movieNm = null,Object? movieNmEn = null,Object? movieNmOg = null,Object? showTm = null,Object? prdtYear = null,Object? openDt = null,Object? prdtStatNm = null,Object? typeNm = null,Object? nations = null,Object? genres = null,Object? directors = null,Object? actors = null,Object? showTypes = null,Object? companys = null,Object? audits = null,Object? staffs = null,}) {
  return _then(_MovieDetailInfoModel(
movieCd: null == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String,movieNm: null == movieNm ? _self.movieNm : movieNm // ignore: cast_nullable_to_non_nullable
as String,movieNmEn: null == movieNmEn ? _self.movieNmEn : movieNmEn // ignore: cast_nullable_to_non_nullable
as String,movieNmOg: null == movieNmOg ? _self.movieNmOg : movieNmOg // ignore: cast_nullable_to_non_nullable
as String,showTm: null == showTm ? _self.showTm : showTm // ignore: cast_nullable_to_non_nullable
as String,prdtYear: null == prdtYear ? _self.prdtYear : prdtYear // ignore: cast_nullable_to_non_nullable
as String,openDt: null == openDt ? _self.openDt : openDt // ignore: cast_nullable_to_non_nullable
as String,prdtStatNm: null == prdtStatNm ? _self.prdtStatNm : prdtStatNm // ignore: cast_nullable_to_non_nullable
as String,typeNm: null == typeNm ? _self.typeNm : typeNm // ignore: cast_nullable_to_non_nullable
as String,nations: null == nations ? _self._nations : nations // ignore: cast_nullable_to_non_nullable
as List<NationModel>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,directors: null == directors ? _self._directors : directors // ignore: cast_nullable_to_non_nullable
as List<PeopleModel>,actors: null == actors ? _self._actors : actors // ignore: cast_nullable_to_non_nullable
as List<PeopleModel>,showTypes: null == showTypes ? _self._showTypes : showTypes // ignore: cast_nullable_to_non_nullable
as List<ShowTypeModel>,companys: null == companys ? _self._companys : companys // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,audits: null == audits ? _self._audits : audits // ignore: cast_nullable_to_non_nullable
as List<AuditModel>,staffs: null == staffs ? _self._staffs : staffs // ignore: cast_nullable_to_non_nullable
as List<StaffModel>,
  ));
}


}


/// @nodoc
mixin _$MovieDetailModel {

 MovieDetailInfoModel get movieInfo; String get source;
/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailModelCopyWith<MovieDetailModel> get copyWith => _$MovieDetailModelCopyWithImpl<MovieDetailModel>(this as MovieDetailModel, _$identity);

  /// Serializes this MovieDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailModel&&(identical(other.movieInfo, movieInfo) || other.movieInfo == movieInfo)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieInfo,source);

@override
String toString() {
  return 'MovieDetailModel(movieInfo: $movieInfo, source: $source)';
}


}

/// @nodoc
abstract mixin class $MovieDetailModelCopyWith<$Res>  {
  factory $MovieDetailModelCopyWith(MovieDetailModel value, $Res Function(MovieDetailModel) _then) = _$MovieDetailModelCopyWithImpl;
@useResult
$Res call({
 MovieDetailInfoModel movieInfo, String source
});


$MovieDetailInfoModelCopyWith<$Res> get movieInfo;

}
/// @nodoc
class _$MovieDetailModelCopyWithImpl<$Res>
    implements $MovieDetailModelCopyWith<$Res> {
  _$MovieDetailModelCopyWithImpl(this._self, this._then);

  final MovieDetailModel _self;
  final $Res Function(MovieDetailModel) _then;

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? movieInfo = null,Object? source = null,}) {
  return _then(_self.copyWith(
movieInfo: null == movieInfo ? _self.movieInfo : movieInfo // ignore: cast_nullable_to_non_nullable
as MovieDetailInfoModel,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailInfoModelCopyWith<$Res> get movieInfo {
  
  return $MovieDetailInfoModelCopyWith<$Res>(_self.movieInfo, (value) {
    return _then(_self.copyWith(movieInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _MovieDetailModel implements MovieDetailModel {
   _MovieDetailModel({required this.movieInfo, required this.source});
  factory _MovieDetailModel.fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);

@override final  MovieDetailInfoModel movieInfo;
@override final  String source;

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailModelCopyWith<_MovieDetailModel> get copyWith => __$MovieDetailModelCopyWithImpl<_MovieDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailModel&&(identical(other.movieInfo, movieInfo) || other.movieInfo == movieInfo)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieInfo,source);

@override
String toString() {
  return 'MovieDetailModel(movieInfo: $movieInfo, source: $source)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailModelCopyWith<$Res> implements $MovieDetailModelCopyWith<$Res> {
  factory _$MovieDetailModelCopyWith(_MovieDetailModel value, $Res Function(_MovieDetailModel) _then) = __$MovieDetailModelCopyWithImpl;
@override @useResult
$Res call({
 MovieDetailInfoModel movieInfo, String source
});


@override $MovieDetailInfoModelCopyWith<$Res> get movieInfo;

}
/// @nodoc
class __$MovieDetailModelCopyWithImpl<$Res>
    implements _$MovieDetailModelCopyWith<$Res> {
  __$MovieDetailModelCopyWithImpl(this._self, this._then);

  final _MovieDetailModel _self;
  final $Res Function(_MovieDetailModel) _then;

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? movieInfo = null,Object? source = null,}) {
  return _then(_MovieDetailModel(
movieInfo: null == movieInfo ? _self.movieInfo : movieInfo // ignore: cast_nullable_to_non_nullable
as MovieDetailInfoModel,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MovieDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieDetailInfoModelCopyWith<$Res> get movieInfo {
  
  return $MovieDetailInfoModelCopyWith<$Res>(_self.movieInfo, (value) {
    return _then(_self.copyWith(movieInfo: value));
  });
}
}


/// @nodoc
mixin _$NationModel {

 String get nationNm;
/// Create a copy of NationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NationModelCopyWith<NationModel> get copyWith => _$NationModelCopyWithImpl<NationModel>(this as NationModel, _$identity);

  /// Serializes this NationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NationModel&&(identical(other.nationNm, nationNm) || other.nationNm == nationNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationNm);

@override
String toString() {
  return 'NationModel(nationNm: $nationNm)';
}


}

/// @nodoc
abstract mixin class $NationModelCopyWith<$Res>  {
  factory $NationModelCopyWith(NationModel value, $Res Function(NationModel) _then) = _$NationModelCopyWithImpl;
@useResult
$Res call({
 String nationNm
});




}
/// @nodoc
class _$NationModelCopyWithImpl<$Res>
    implements $NationModelCopyWith<$Res> {
  _$NationModelCopyWithImpl(this._self, this._then);

  final NationModel _self;
  final $Res Function(NationModel) _then;

/// Create a copy of NationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nationNm = null,}) {
  return _then(_self.copyWith(
nationNm: null == nationNm ? _self.nationNm : nationNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NationModel implements NationModel {
   _NationModel({required this.nationNm});
  factory _NationModel.fromJson(Map<String, dynamic> json) => _$NationModelFromJson(json);

@override final  String nationNm;

/// Create a copy of NationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NationModelCopyWith<_NationModel> get copyWith => __$NationModelCopyWithImpl<_NationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NationModel&&(identical(other.nationNm, nationNm) || other.nationNm == nationNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nationNm);

@override
String toString() {
  return 'NationModel(nationNm: $nationNm)';
}


}

/// @nodoc
abstract mixin class _$NationModelCopyWith<$Res> implements $NationModelCopyWith<$Res> {
  factory _$NationModelCopyWith(_NationModel value, $Res Function(_NationModel) _then) = __$NationModelCopyWithImpl;
@override @useResult
$Res call({
 String nationNm
});




}
/// @nodoc
class __$NationModelCopyWithImpl<$Res>
    implements _$NationModelCopyWith<$Res> {
  __$NationModelCopyWithImpl(this._self, this._then);

  final _NationModel _self;
  final $Res Function(_NationModel) _then;

/// Create a copy of NationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nationNm = null,}) {
  return _then(_NationModel(
nationNm: null == nationNm ? _self.nationNm : nationNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GenreModel {

 String get genreNm;
/// Create a copy of GenreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreModelCopyWith<GenreModel> get copyWith => _$GenreModelCopyWithImpl<GenreModel>(this as GenreModel, _$identity);

  /// Serializes this GenreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreModel&&(identical(other.genreNm, genreNm) || other.genreNm == genreNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genreNm);

@override
String toString() {
  return 'GenreModel(genreNm: $genreNm)';
}


}

/// @nodoc
abstract mixin class $GenreModelCopyWith<$Res>  {
  factory $GenreModelCopyWith(GenreModel value, $Res Function(GenreModel) _then) = _$GenreModelCopyWithImpl;
@useResult
$Res call({
 String genreNm
});




}
/// @nodoc
class _$GenreModelCopyWithImpl<$Res>
    implements $GenreModelCopyWith<$Res> {
  _$GenreModelCopyWithImpl(this._self, this._then);

  final GenreModel _self;
  final $Res Function(GenreModel) _then;

/// Create a copy of GenreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genreNm = null,}) {
  return _then(_self.copyWith(
genreNm: null == genreNm ? _self.genreNm : genreNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenreModel implements GenreModel {
   _GenreModel({required this.genreNm});
  factory _GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);

@override final  String genreNm;

/// Create a copy of GenreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreModelCopyWith<_GenreModel> get copyWith => __$GenreModelCopyWithImpl<_GenreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenreModel&&(identical(other.genreNm, genreNm) || other.genreNm == genreNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,genreNm);

@override
String toString() {
  return 'GenreModel(genreNm: $genreNm)';
}


}

/// @nodoc
abstract mixin class _$GenreModelCopyWith<$Res> implements $GenreModelCopyWith<$Res> {
  factory _$GenreModelCopyWith(_GenreModel value, $Res Function(_GenreModel) _then) = __$GenreModelCopyWithImpl;
@override @useResult
$Res call({
 String genreNm
});




}
/// @nodoc
class __$GenreModelCopyWithImpl<$Res>
    implements _$GenreModelCopyWith<$Res> {
  __$GenreModelCopyWithImpl(this._self, this._then);

  final _GenreModel _self;
  final $Res Function(_GenreModel) _then;

/// Create a copy of GenreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genreNm = null,}) {
  return _then(_GenreModel(
genreNm: null == genreNm ? _self.genreNm : genreNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PeopleModel {

 String get peopleNm; String get peopleNmEn; String? get cast; String? get castEn;
/// Create a copy of PeopleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeopleModelCopyWith<PeopleModel> get copyWith => _$PeopleModelCopyWithImpl<PeopleModel>(this as PeopleModel, _$identity);

  /// Serializes this PeopleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeopleModel&&(identical(other.peopleNm, peopleNm) || other.peopleNm == peopleNm)&&(identical(other.peopleNmEn, peopleNmEn) || other.peopleNmEn == peopleNmEn)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.castEn, castEn) || other.castEn == castEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peopleNm,peopleNmEn,cast,castEn);

@override
String toString() {
  return 'PeopleModel(peopleNm: $peopleNm, peopleNmEn: $peopleNmEn, cast: $cast, castEn: $castEn)';
}


}

/// @nodoc
abstract mixin class $PeopleModelCopyWith<$Res>  {
  factory $PeopleModelCopyWith(PeopleModel value, $Res Function(PeopleModel) _then) = _$PeopleModelCopyWithImpl;
@useResult
$Res call({
 String peopleNm, String peopleNmEn, String? cast, String? castEn
});




}
/// @nodoc
class _$PeopleModelCopyWithImpl<$Res>
    implements $PeopleModelCopyWith<$Res> {
  _$PeopleModelCopyWithImpl(this._self, this._then);

  final PeopleModel _self;
  final $Res Function(PeopleModel) _then;

/// Create a copy of PeopleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? peopleNm = null,Object? peopleNmEn = null,Object? cast = freezed,Object? castEn = freezed,}) {
  return _then(_self.copyWith(
peopleNm: null == peopleNm ? _self.peopleNm : peopleNm // ignore: cast_nullable_to_non_nullable
as String,peopleNmEn: null == peopleNmEn ? _self.peopleNmEn : peopleNmEn // ignore: cast_nullable_to_non_nullable
as String,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,castEn: freezed == castEn ? _self.castEn : castEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PeopleModel implements PeopleModel {
   _PeopleModel({required this.peopleNm, required this.peopleNmEn, this.cast, this.castEn});
  factory _PeopleModel.fromJson(Map<String, dynamic> json) => _$PeopleModelFromJson(json);

@override final  String peopleNm;
@override final  String peopleNmEn;
@override final  String? cast;
@override final  String? castEn;

/// Create a copy of PeopleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeopleModelCopyWith<_PeopleModel> get copyWith => __$PeopleModelCopyWithImpl<_PeopleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeopleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeopleModel&&(identical(other.peopleNm, peopleNm) || other.peopleNm == peopleNm)&&(identical(other.peopleNmEn, peopleNmEn) || other.peopleNmEn == peopleNmEn)&&(identical(other.cast, cast) || other.cast == cast)&&(identical(other.castEn, castEn) || other.castEn == castEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peopleNm,peopleNmEn,cast,castEn);

@override
String toString() {
  return 'PeopleModel(peopleNm: $peopleNm, peopleNmEn: $peopleNmEn, cast: $cast, castEn: $castEn)';
}


}

/// @nodoc
abstract mixin class _$PeopleModelCopyWith<$Res> implements $PeopleModelCopyWith<$Res> {
  factory _$PeopleModelCopyWith(_PeopleModel value, $Res Function(_PeopleModel) _then) = __$PeopleModelCopyWithImpl;
@override @useResult
$Res call({
 String peopleNm, String peopleNmEn, String? cast, String? castEn
});




}
/// @nodoc
class __$PeopleModelCopyWithImpl<$Res>
    implements _$PeopleModelCopyWith<$Res> {
  __$PeopleModelCopyWithImpl(this._self, this._then);

  final _PeopleModel _self;
  final $Res Function(_PeopleModel) _then;

/// Create a copy of PeopleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? peopleNm = null,Object? peopleNmEn = null,Object? cast = freezed,Object? castEn = freezed,}) {
  return _then(_PeopleModel(
peopleNm: null == peopleNm ? _self.peopleNm : peopleNm // ignore: cast_nullable_to_non_nullable
as String,peopleNmEn: null == peopleNmEn ? _self.peopleNmEn : peopleNmEn // ignore: cast_nullable_to_non_nullable
as String,cast: freezed == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as String?,castEn: freezed == castEn ? _self.castEn : castEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShowTypeModel {

 String get showTypeGroupNm; String get showTypeNm;
/// Create a copy of ShowTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowTypeModelCopyWith<ShowTypeModel> get copyWith => _$ShowTypeModelCopyWithImpl<ShowTypeModel>(this as ShowTypeModel, _$identity);

  /// Serializes this ShowTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowTypeModel&&(identical(other.showTypeGroupNm, showTypeGroupNm) || other.showTypeGroupNm == showTypeGroupNm)&&(identical(other.showTypeNm, showTypeNm) || other.showTypeNm == showTypeNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showTypeGroupNm,showTypeNm);

@override
String toString() {
  return 'ShowTypeModel(showTypeGroupNm: $showTypeGroupNm, showTypeNm: $showTypeNm)';
}


}

/// @nodoc
abstract mixin class $ShowTypeModelCopyWith<$Res>  {
  factory $ShowTypeModelCopyWith(ShowTypeModel value, $Res Function(ShowTypeModel) _then) = _$ShowTypeModelCopyWithImpl;
@useResult
$Res call({
 String showTypeGroupNm, String showTypeNm
});




}
/// @nodoc
class _$ShowTypeModelCopyWithImpl<$Res>
    implements $ShowTypeModelCopyWith<$Res> {
  _$ShowTypeModelCopyWithImpl(this._self, this._then);

  final ShowTypeModel _self;
  final $Res Function(ShowTypeModel) _then;

/// Create a copy of ShowTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showTypeGroupNm = null,Object? showTypeNm = null,}) {
  return _then(_self.copyWith(
showTypeGroupNm: null == showTypeGroupNm ? _self.showTypeGroupNm : showTypeGroupNm // ignore: cast_nullable_to_non_nullable
as String,showTypeNm: null == showTypeNm ? _self.showTypeNm : showTypeNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ShowTypeModel implements ShowTypeModel {
   _ShowTypeModel({required this.showTypeGroupNm, required this.showTypeNm});
  factory _ShowTypeModel.fromJson(Map<String, dynamic> json) => _$ShowTypeModelFromJson(json);

@override final  String showTypeGroupNm;
@override final  String showTypeNm;

/// Create a copy of ShowTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowTypeModelCopyWith<_ShowTypeModel> get copyWith => __$ShowTypeModelCopyWithImpl<_ShowTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShowTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowTypeModel&&(identical(other.showTypeGroupNm, showTypeGroupNm) || other.showTypeGroupNm == showTypeGroupNm)&&(identical(other.showTypeNm, showTypeNm) || other.showTypeNm == showTypeNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showTypeGroupNm,showTypeNm);

@override
String toString() {
  return 'ShowTypeModel(showTypeGroupNm: $showTypeGroupNm, showTypeNm: $showTypeNm)';
}


}

/// @nodoc
abstract mixin class _$ShowTypeModelCopyWith<$Res> implements $ShowTypeModelCopyWith<$Res> {
  factory _$ShowTypeModelCopyWith(_ShowTypeModel value, $Res Function(_ShowTypeModel) _then) = __$ShowTypeModelCopyWithImpl;
@override @useResult
$Res call({
 String showTypeGroupNm, String showTypeNm
});




}
/// @nodoc
class __$ShowTypeModelCopyWithImpl<$Res>
    implements _$ShowTypeModelCopyWith<$Res> {
  __$ShowTypeModelCopyWithImpl(this._self, this._then);

  final _ShowTypeModel _self;
  final $Res Function(_ShowTypeModel) _then;

/// Create a copy of ShowTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showTypeGroupNm = null,Object? showTypeNm = null,}) {
  return _then(_ShowTypeModel(
showTypeGroupNm: null == showTypeGroupNm ? _self.showTypeGroupNm : showTypeGroupNm // ignore: cast_nullable_to_non_nullable
as String,showTypeNm: null == showTypeNm ? _self.showTypeNm : showTypeNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CompanyModel {

 String get companyCd; String get companyNm; String get companyNmEn; String get companyPartNm;
/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<CompanyModel> get copyWith => _$CompanyModelCopyWithImpl<CompanyModel>(this as CompanyModel, _$identity);

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyModel&&(identical(other.companyCd, companyCd) || other.companyCd == companyCd)&&(identical(other.companyNm, companyNm) || other.companyNm == companyNm)&&(identical(other.companyNmEn, companyNmEn) || other.companyNmEn == companyNmEn)&&(identical(other.companyPartNm, companyPartNm) || other.companyPartNm == companyPartNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyCd,companyNm,companyNmEn,companyPartNm);

@override
String toString() {
  return 'CompanyModel(companyCd: $companyCd, companyNm: $companyNm, companyNmEn: $companyNmEn, companyPartNm: $companyPartNm)';
}


}

/// @nodoc
abstract mixin class $CompanyModelCopyWith<$Res>  {
  factory $CompanyModelCopyWith(CompanyModel value, $Res Function(CompanyModel) _then) = _$CompanyModelCopyWithImpl;
@useResult
$Res call({
 String companyCd, String companyNm, String companyNmEn, String companyPartNm
});




}
/// @nodoc
class _$CompanyModelCopyWithImpl<$Res>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._self, this._then);

  final CompanyModel _self;
  final $Res Function(CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyCd = null,Object? companyNm = null,Object? companyNmEn = null,Object? companyPartNm = null,}) {
  return _then(_self.copyWith(
companyCd: null == companyCd ? _self.companyCd : companyCd // ignore: cast_nullable_to_non_nullable
as String,companyNm: null == companyNm ? _self.companyNm : companyNm // ignore: cast_nullable_to_non_nullable
as String,companyNmEn: null == companyNmEn ? _self.companyNmEn : companyNmEn // ignore: cast_nullable_to_non_nullable
as String,companyPartNm: null == companyPartNm ? _self.companyPartNm : companyPartNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CompanyModel implements CompanyModel {
   _CompanyModel({required this.companyCd, required this.companyNm, required this.companyNmEn, required this.companyPartNm});
  factory _CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

@override final  String companyCd;
@override final  String companyNm;
@override final  String companyNmEn;
@override final  String companyPartNm;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyModelCopyWith<_CompanyModel> get copyWith => __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyModel&&(identical(other.companyCd, companyCd) || other.companyCd == companyCd)&&(identical(other.companyNm, companyNm) || other.companyNm == companyNm)&&(identical(other.companyNmEn, companyNmEn) || other.companyNmEn == companyNmEn)&&(identical(other.companyPartNm, companyPartNm) || other.companyPartNm == companyPartNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyCd,companyNm,companyNmEn,companyPartNm);

@override
String toString() {
  return 'CompanyModel(companyCd: $companyCd, companyNm: $companyNm, companyNmEn: $companyNmEn, companyPartNm: $companyPartNm)';
}


}

/// @nodoc
abstract mixin class _$CompanyModelCopyWith<$Res> implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(_CompanyModel value, $Res Function(_CompanyModel) _then) = __$CompanyModelCopyWithImpl;
@override @useResult
$Res call({
 String companyCd, String companyNm, String companyNmEn, String companyPartNm
});




}
/// @nodoc
class __$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(this._self, this._then);

  final _CompanyModel _self;
  final $Res Function(_CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyCd = null,Object? companyNm = null,Object? companyNmEn = null,Object? companyPartNm = null,}) {
  return _then(_CompanyModel(
companyCd: null == companyCd ? _self.companyCd : companyCd // ignore: cast_nullable_to_non_nullable
as String,companyNm: null == companyNm ? _self.companyNm : companyNm // ignore: cast_nullable_to_non_nullable
as String,companyNmEn: null == companyNmEn ? _self.companyNmEn : companyNmEn // ignore: cast_nullable_to_non_nullable
as String,companyPartNm: null == companyPartNm ? _self.companyPartNm : companyPartNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuditModel {

 String get auditNo; String get watchGradeNm;
/// Create a copy of AuditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditModelCopyWith<AuditModel> get copyWith => _$AuditModelCopyWithImpl<AuditModel>(this as AuditModel, _$identity);

  /// Serializes this AuditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditModel&&(identical(other.auditNo, auditNo) || other.auditNo == auditNo)&&(identical(other.watchGradeNm, watchGradeNm) || other.watchGradeNm == watchGradeNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auditNo,watchGradeNm);

@override
String toString() {
  return 'AuditModel(auditNo: $auditNo, watchGradeNm: $watchGradeNm)';
}


}

/// @nodoc
abstract mixin class $AuditModelCopyWith<$Res>  {
  factory $AuditModelCopyWith(AuditModel value, $Res Function(AuditModel) _then) = _$AuditModelCopyWithImpl;
@useResult
$Res call({
 String auditNo, String watchGradeNm
});




}
/// @nodoc
class _$AuditModelCopyWithImpl<$Res>
    implements $AuditModelCopyWith<$Res> {
  _$AuditModelCopyWithImpl(this._self, this._then);

  final AuditModel _self;
  final $Res Function(AuditModel) _then;

/// Create a copy of AuditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auditNo = null,Object? watchGradeNm = null,}) {
  return _then(_self.copyWith(
auditNo: null == auditNo ? _self.auditNo : auditNo // ignore: cast_nullable_to_non_nullable
as String,watchGradeNm: null == watchGradeNm ? _self.watchGradeNm : watchGradeNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuditModel implements AuditModel {
   _AuditModel({required this.auditNo, required this.watchGradeNm});
  factory _AuditModel.fromJson(Map<String, dynamic> json) => _$AuditModelFromJson(json);

@override final  String auditNo;
@override final  String watchGradeNm;

/// Create a copy of AuditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditModelCopyWith<_AuditModel> get copyWith => __$AuditModelCopyWithImpl<_AuditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditModel&&(identical(other.auditNo, auditNo) || other.auditNo == auditNo)&&(identical(other.watchGradeNm, watchGradeNm) || other.watchGradeNm == watchGradeNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auditNo,watchGradeNm);

@override
String toString() {
  return 'AuditModel(auditNo: $auditNo, watchGradeNm: $watchGradeNm)';
}


}

/// @nodoc
abstract mixin class _$AuditModelCopyWith<$Res> implements $AuditModelCopyWith<$Res> {
  factory _$AuditModelCopyWith(_AuditModel value, $Res Function(_AuditModel) _then) = __$AuditModelCopyWithImpl;
@override @useResult
$Res call({
 String auditNo, String watchGradeNm
});




}
/// @nodoc
class __$AuditModelCopyWithImpl<$Res>
    implements _$AuditModelCopyWith<$Res> {
  __$AuditModelCopyWithImpl(this._self, this._then);

  final _AuditModel _self;
  final $Res Function(_AuditModel) _then;

/// Create a copy of AuditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auditNo = null,Object? watchGradeNm = null,}) {
  return _then(_AuditModel(
auditNo: null == auditNo ? _self.auditNo : auditNo // ignore: cast_nullable_to_non_nullable
as String,watchGradeNm: null == watchGradeNm ? _self.watchGradeNm : watchGradeNm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StaffModel {

 String get peopleNm; String get peopleNmEn; String? get staffRoleNm;
/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffModelCopyWith<StaffModel> get copyWith => _$StaffModelCopyWithImpl<StaffModel>(this as StaffModel, _$identity);

  /// Serializes this StaffModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffModel&&(identical(other.peopleNm, peopleNm) || other.peopleNm == peopleNm)&&(identical(other.peopleNmEn, peopleNmEn) || other.peopleNmEn == peopleNmEn)&&(identical(other.staffRoleNm, staffRoleNm) || other.staffRoleNm == staffRoleNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peopleNm,peopleNmEn,staffRoleNm);

@override
String toString() {
  return 'StaffModel(peopleNm: $peopleNm, peopleNmEn: $peopleNmEn, staffRoleNm: $staffRoleNm)';
}


}

/// @nodoc
abstract mixin class $StaffModelCopyWith<$Res>  {
  factory $StaffModelCopyWith(StaffModel value, $Res Function(StaffModel) _then) = _$StaffModelCopyWithImpl;
@useResult
$Res call({
 String peopleNm, String peopleNmEn, String? staffRoleNm
});




}
/// @nodoc
class _$StaffModelCopyWithImpl<$Res>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._self, this._then);

  final StaffModel _self;
  final $Res Function(StaffModel) _then;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? peopleNm = null,Object? peopleNmEn = null,Object? staffRoleNm = freezed,}) {
  return _then(_self.copyWith(
peopleNm: null == peopleNm ? _self.peopleNm : peopleNm // ignore: cast_nullable_to_non_nullable
as String,peopleNmEn: null == peopleNmEn ? _self.peopleNmEn : peopleNmEn // ignore: cast_nullable_to_non_nullable
as String,staffRoleNm: freezed == staffRoleNm ? _self.staffRoleNm : staffRoleNm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StaffModel implements StaffModel {
   _StaffModel({required this.peopleNm, required this.peopleNmEn, this.staffRoleNm});
  factory _StaffModel.fromJson(Map<String, dynamic> json) => _$StaffModelFromJson(json);

@override final  String peopleNm;
@override final  String peopleNmEn;
@override final  String? staffRoleNm;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffModelCopyWith<_StaffModel> get copyWith => __$StaffModelCopyWithImpl<_StaffModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffModel&&(identical(other.peopleNm, peopleNm) || other.peopleNm == peopleNm)&&(identical(other.peopleNmEn, peopleNmEn) || other.peopleNmEn == peopleNmEn)&&(identical(other.staffRoleNm, staffRoleNm) || other.staffRoleNm == staffRoleNm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,peopleNm,peopleNmEn,staffRoleNm);

@override
String toString() {
  return 'StaffModel(peopleNm: $peopleNm, peopleNmEn: $peopleNmEn, staffRoleNm: $staffRoleNm)';
}


}

/// @nodoc
abstract mixin class _$StaffModelCopyWith<$Res> implements $StaffModelCopyWith<$Res> {
  factory _$StaffModelCopyWith(_StaffModel value, $Res Function(_StaffModel) _then) = __$StaffModelCopyWithImpl;
@override @useResult
$Res call({
 String peopleNm, String peopleNmEn, String? staffRoleNm
});




}
/// @nodoc
class __$StaffModelCopyWithImpl<$Res>
    implements _$StaffModelCopyWith<$Res> {
  __$StaffModelCopyWithImpl(this._self, this._then);

  final _StaffModel _self;
  final $Res Function(_StaffModel) _then;

/// Create a copy of StaffModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? peopleNm = null,Object? peopleNmEn = null,Object? staffRoleNm = freezed,}) {
  return _then(_StaffModel(
peopleNm: null == peopleNm ? _self.peopleNm : peopleNm // ignore: cast_nullable_to_non_nullable
as String,peopleNmEn: null == peopleNmEn ? _self.peopleNmEn : peopleNmEn // ignore: cast_nullable_to_non_nullable
as String,staffRoleNm: freezed == staffRoleNm ? _self.staffRoleNm : staffRoleNm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
