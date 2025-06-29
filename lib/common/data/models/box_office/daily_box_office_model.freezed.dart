// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_box_office_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyBoxOfficeModel {

/// 박스오피스 종류를 출력합니다.
 String get boxofficeType;/// 박스오피스 조회 일자를 출력합니다.
 String get showRange;/// 일별 박스오피스 영화 목록
 List<DailyBoxOfficeMovieModel> get dailyBoxOfficeList;
/// Create a copy of DailyBoxOfficeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBoxOfficeModelCopyWith<DailyBoxOfficeModel> get copyWith => _$DailyBoxOfficeModelCopyWithImpl<DailyBoxOfficeModel>(this as DailyBoxOfficeModel, _$identity);

  /// Serializes this DailyBoxOfficeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBoxOfficeModel&&(identical(other.boxofficeType, boxofficeType) || other.boxofficeType == boxofficeType)&&(identical(other.showRange, showRange) || other.showRange == showRange)&&const DeepCollectionEquality().equals(other.dailyBoxOfficeList, dailyBoxOfficeList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boxofficeType,showRange,const DeepCollectionEquality().hash(dailyBoxOfficeList));

@override
String toString() {
  return 'DailyBoxOfficeModel(boxofficeType: $boxofficeType, showRange: $showRange, dailyBoxOfficeList: $dailyBoxOfficeList)';
}


}

/// @nodoc
abstract mixin class $DailyBoxOfficeModelCopyWith<$Res>  {
  factory $DailyBoxOfficeModelCopyWith(DailyBoxOfficeModel value, $Res Function(DailyBoxOfficeModel) _then) = _$DailyBoxOfficeModelCopyWithImpl;
@useResult
$Res call({
 String boxofficeType, String showRange, List<DailyBoxOfficeMovieModel> dailyBoxOfficeList
});




}
/// @nodoc
class _$DailyBoxOfficeModelCopyWithImpl<$Res>
    implements $DailyBoxOfficeModelCopyWith<$Res> {
  _$DailyBoxOfficeModelCopyWithImpl(this._self, this._then);

  final DailyBoxOfficeModel _self;
  final $Res Function(DailyBoxOfficeModel) _then;

/// Create a copy of DailyBoxOfficeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boxofficeType = null,Object? showRange = null,Object? dailyBoxOfficeList = null,}) {
  return _then(_self.copyWith(
boxofficeType: null == boxofficeType ? _self.boxofficeType : boxofficeType // ignore: cast_nullable_to_non_nullable
as String,showRange: null == showRange ? _self.showRange : showRange // ignore: cast_nullable_to_non_nullable
as String,dailyBoxOfficeList: null == dailyBoxOfficeList ? _self.dailyBoxOfficeList : dailyBoxOfficeList // ignore: cast_nullable_to_non_nullable
as List<DailyBoxOfficeMovieModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DailyBoxOfficeModel implements DailyBoxOfficeModel {
  const _DailyBoxOfficeModel({required this.boxofficeType, required this.showRange, required final  List<DailyBoxOfficeMovieModel> dailyBoxOfficeList}): _dailyBoxOfficeList = dailyBoxOfficeList;
  factory _DailyBoxOfficeModel.fromJson(Map<String, dynamic> json) => _$DailyBoxOfficeModelFromJson(json);

/// 박스오피스 종류를 출력합니다.
@override final  String boxofficeType;
/// 박스오피스 조회 일자를 출력합니다.
@override final  String showRange;
/// 일별 박스오피스 영화 목록
 final  List<DailyBoxOfficeMovieModel> _dailyBoxOfficeList;
/// 일별 박스오피스 영화 목록
@override List<DailyBoxOfficeMovieModel> get dailyBoxOfficeList {
  if (_dailyBoxOfficeList is EqualUnmodifiableListView) return _dailyBoxOfficeList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyBoxOfficeList);
}


/// Create a copy of DailyBoxOfficeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBoxOfficeModelCopyWith<_DailyBoxOfficeModel> get copyWith => __$DailyBoxOfficeModelCopyWithImpl<_DailyBoxOfficeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBoxOfficeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBoxOfficeModel&&(identical(other.boxofficeType, boxofficeType) || other.boxofficeType == boxofficeType)&&(identical(other.showRange, showRange) || other.showRange == showRange)&&const DeepCollectionEquality().equals(other._dailyBoxOfficeList, _dailyBoxOfficeList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,boxofficeType,showRange,const DeepCollectionEquality().hash(_dailyBoxOfficeList));

@override
String toString() {
  return 'DailyBoxOfficeModel(boxofficeType: $boxofficeType, showRange: $showRange, dailyBoxOfficeList: $dailyBoxOfficeList)';
}


}

/// @nodoc
abstract mixin class _$DailyBoxOfficeModelCopyWith<$Res> implements $DailyBoxOfficeModelCopyWith<$Res> {
  factory _$DailyBoxOfficeModelCopyWith(_DailyBoxOfficeModel value, $Res Function(_DailyBoxOfficeModel) _then) = __$DailyBoxOfficeModelCopyWithImpl;
@override @useResult
$Res call({
 String boxofficeType, String showRange, List<DailyBoxOfficeMovieModel> dailyBoxOfficeList
});




}
/// @nodoc
class __$DailyBoxOfficeModelCopyWithImpl<$Res>
    implements _$DailyBoxOfficeModelCopyWith<$Res> {
  __$DailyBoxOfficeModelCopyWithImpl(this._self, this._then);

  final _DailyBoxOfficeModel _self;
  final $Res Function(_DailyBoxOfficeModel) _then;

/// Create a copy of DailyBoxOfficeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boxofficeType = null,Object? showRange = null,Object? dailyBoxOfficeList = null,}) {
  return _then(_DailyBoxOfficeModel(
boxofficeType: null == boxofficeType ? _self.boxofficeType : boxofficeType // ignore: cast_nullable_to_non_nullable
as String,showRange: null == showRange ? _self.showRange : showRange // ignore: cast_nullable_to_non_nullable
as String,dailyBoxOfficeList: null == dailyBoxOfficeList ? _self._dailyBoxOfficeList : dailyBoxOfficeList // ignore: cast_nullable_to_non_nullable
as List<DailyBoxOfficeMovieModel>,
  ));
}


}


/// @nodoc
mixin _$DailyBoxOfficeMovieModel {

/// 순번을 출력합니다.
 String? get rnum;/// 해당일자의 박스오피스 순위를 출력합니다.
 String? get rank;/// 전일대비 순위의 증감분을 출력합니다.
 String? get rankInten;/// 랭킹에 신규진입여부를 출력합니다.
 String? get rankOldAndNew;/// 영화의 대표코드를 출력합니다.
 String? get movieCd;/// 영화명(국문)을 출력합니다.
 String? get movieNm;/// 영화의 개봉일을 출력합니다.
 String? get openDt;/// 해당일의 매출액을 출력합니다.
 String? get salesAmt;/// 해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
 String? get salesShare;/// 전일 대비 매출액 증감분을 출력합니다.
 String? get salesInten;/// 전일 대비 매출액 증감 비율을 출력합니다.
 String? get salesChange;/// 누적매출액을 출력합니다.
 String? get salesAcc;/// 해당일의 관객수를 출력합니다.
 String? get audiCnt;/// 전일 대비 관객수 증감분을 출력합니다.
 String? get audiInten;/// 전일 대비 관객수 증감 비율을 출력합니다.
 String? get audiChange;/// 누적관객수를 출력합니다.
 String? get audiAcc;/// 해당일자에 상영한 스크린수를 출력합니다.
 String? get scrnCnt;/// 해당일자에 상영된 횟수를 출력합니다.
 String? get showCnt;
/// Create a copy of DailyBoxOfficeMovieModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBoxOfficeMovieModelCopyWith<DailyBoxOfficeMovieModel> get copyWith => _$DailyBoxOfficeMovieModelCopyWithImpl<DailyBoxOfficeMovieModel>(this as DailyBoxOfficeMovieModel, _$identity);

  /// Serializes this DailyBoxOfficeMovieModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBoxOfficeMovieModel&&(identical(other.rnum, rnum) || other.rnum == rnum)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.rankInten, rankInten) || other.rankInten == rankInten)&&(identical(other.rankOldAndNew, rankOldAndNew) || other.rankOldAndNew == rankOldAndNew)&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd)&&(identical(other.movieNm, movieNm) || other.movieNm == movieNm)&&(identical(other.openDt, openDt) || other.openDt == openDt)&&(identical(other.salesAmt, salesAmt) || other.salesAmt == salesAmt)&&(identical(other.salesShare, salesShare) || other.salesShare == salesShare)&&(identical(other.salesInten, salesInten) || other.salesInten == salesInten)&&(identical(other.salesChange, salesChange) || other.salesChange == salesChange)&&(identical(other.salesAcc, salesAcc) || other.salesAcc == salesAcc)&&(identical(other.audiCnt, audiCnt) || other.audiCnt == audiCnt)&&(identical(other.audiInten, audiInten) || other.audiInten == audiInten)&&(identical(other.audiChange, audiChange) || other.audiChange == audiChange)&&(identical(other.audiAcc, audiAcc) || other.audiAcc == audiAcc)&&(identical(other.scrnCnt, scrnCnt) || other.scrnCnt == scrnCnt)&&(identical(other.showCnt, showCnt) || other.showCnt == showCnt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rnum,rank,rankInten,rankOldAndNew,movieCd,movieNm,openDt,salesAmt,salesShare,salesInten,salesChange,salesAcc,audiCnt,audiInten,audiChange,audiAcc,scrnCnt,showCnt);

@override
String toString() {
  return 'DailyBoxOfficeMovieModel(rnum: $rnum, rank: $rank, rankInten: $rankInten, rankOldAndNew: $rankOldAndNew, movieCd: $movieCd, movieNm: $movieNm, openDt: $openDt, salesAmt: $salesAmt, salesShare: $salesShare, salesInten: $salesInten, salesChange: $salesChange, salesAcc: $salesAcc, audiCnt: $audiCnt, audiInten: $audiInten, audiChange: $audiChange, audiAcc: $audiAcc, scrnCnt: $scrnCnt, showCnt: $showCnt)';
}


}

/// @nodoc
abstract mixin class $DailyBoxOfficeMovieModelCopyWith<$Res>  {
  factory $DailyBoxOfficeMovieModelCopyWith(DailyBoxOfficeMovieModel value, $Res Function(DailyBoxOfficeMovieModel) _then) = _$DailyBoxOfficeMovieModelCopyWithImpl;
@useResult
$Res call({
 String? rnum, String? rank, String? rankInten, String? rankOldAndNew, String? movieCd, String? movieNm, String? openDt, String? salesAmt, String? salesShare, String? salesInten, String? salesChange, String? salesAcc, String? audiCnt, String? audiInten, String? audiChange, String? audiAcc, String? scrnCnt, String? showCnt
});




}
/// @nodoc
class _$DailyBoxOfficeMovieModelCopyWithImpl<$Res>
    implements $DailyBoxOfficeMovieModelCopyWith<$Res> {
  _$DailyBoxOfficeMovieModelCopyWithImpl(this._self, this._then);

  final DailyBoxOfficeMovieModel _self;
  final $Res Function(DailyBoxOfficeMovieModel) _then;

/// Create a copy of DailyBoxOfficeMovieModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rnum = freezed,Object? rank = freezed,Object? rankInten = freezed,Object? rankOldAndNew = freezed,Object? movieCd = freezed,Object? movieNm = freezed,Object? openDt = freezed,Object? salesAmt = freezed,Object? salesShare = freezed,Object? salesInten = freezed,Object? salesChange = freezed,Object? salesAcc = freezed,Object? audiCnt = freezed,Object? audiInten = freezed,Object? audiChange = freezed,Object? audiAcc = freezed,Object? scrnCnt = freezed,Object? showCnt = freezed,}) {
  return _then(_self.copyWith(
rnum: freezed == rnum ? _self.rnum : rnum // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,rankInten: freezed == rankInten ? _self.rankInten : rankInten // ignore: cast_nullable_to_non_nullable
as String?,rankOldAndNew: freezed == rankOldAndNew ? _self.rankOldAndNew : rankOldAndNew // ignore: cast_nullable_to_non_nullable
as String?,movieCd: freezed == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String?,movieNm: freezed == movieNm ? _self.movieNm : movieNm // ignore: cast_nullable_to_non_nullable
as String?,openDt: freezed == openDt ? _self.openDt : openDt // ignore: cast_nullable_to_non_nullable
as String?,salesAmt: freezed == salesAmt ? _self.salesAmt : salesAmt // ignore: cast_nullable_to_non_nullable
as String?,salesShare: freezed == salesShare ? _self.salesShare : salesShare // ignore: cast_nullable_to_non_nullable
as String?,salesInten: freezed == salesInten ? _self.salesInten : salesInten // ignore: cast_nullable_to_non_nullable
as String?,salesChange: freezed == salesChange ? _self.salesChange : salesChange // ignore: cast_nullable_to_non_nullable
as String?,salesAcc: freezed == salesAcc ? _self.salesAcc : salesAcc // ignore: cast_nullable_to_non_nullable
as String?,audiCnt: freezed == audiCnt ? _self.audiCnt : audiCnt // ignore: cast_nullable_to_non_nullable
as String?,audiInten: freezed == audiInten ? _self.audiInten : audiInten // ignore: cast_nullable_to_non_nullable
as String?,audiChange: freezed == audiChange ? _self.audiChange : audiChange // ignore: cast_nullable_to_non_nullable
as String?,audiAcc: freezed == audiAcc ? _self.audiAcc : audiAcc // ignore: cast_nullable_to_non_nullable
as String?,scrnCnt: freezed == scrnCnt ? _self.scrnCnt : scrnCnt // ignore: cast_nullable_to_non_nullable
as String?,showCnt: freezed == showCnt ? _self.showCnt : showCnt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DailyBoxOfficeMovieModel implements DailyBoxOfficeMovieModel {
   _DailyBoxOfficeMovieModel({this.rnum, this.rank, this.rankInten, this.rankOldAndNew, this.movieCd, this.movieNm, this.openDt, this.salesAmt, this.salesShare, this.salesInten, this.salesChange, this.salesAcc, this.audiCnt, this.audiInten, this.audiChange, this.audiAcc, this.scrnCnt, this.showCnt});
  factory _DailyBoxOfficeMovieModel.fromJson(Map<String, dynamic> json) => _$DailyBoxOfficeMovieModelFromJson(json);

/// 순번을 출력합니다.
@override final  String? rnum;
/// 해당일자의 박스오피스 순위를 출력합니다.
@override final  String? rank;
/// 전일대비 순위의 증감분을 출력합니다.
@override final  String? rankInten;
/// 랭킹에 신규진입여부를 출력합니다.
@override final  String? rankOldAndNew;
/// 영화의 대표코드를 출력합니다.
@override final  String? movieCd;
/// 영화명(국문)을 출력합니다.
@override final  String? movieNm;
/// 영화의 개봉일을 출력합니다.
@override final  String? openDt;
/// 해당일의 매출액을 출력합니다.
@override final  String? salesAmt;
/// 해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
@override final  String? salesShare;
/// 전일 대비 매출액 증감분을 출력합니다.
@override final  String? salesInten;
/// 전일 대비 매출액 증감 비율을 출력합니다.
@override final  String? salesChange;
/// 누적매출액을 출력합니다.
@override final  String? salesAcc;
/// 해당일의 관객수를 출력합니다.
@override final  String? audiCnt;
/// 전일 대비 관객수 증감분을 출력합니다.
@override final  String? audiInten;
/// 전일 대비 관객수 증감 비율을 출력합니다.
@override final  String? audiChange;
/// 누적관객수를 출력합니다.
@override final  String? audiAcc;
/// 해당일자에 상영한 스크린수를 출력합니다.
@override final  String? scrnCnt;
/// 해당일자에 상영된 횟수를 출력합니다.
@override final  String? showCnt;

/// Create a copy of DailyBoxOfficeMovieModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBoxOfficeMovieModelCopyWith<_DailyBoxOfficeMovieModel> get copyWith => __$DailyBoxOfficeMovieModelCopyWithImpl<_DailyBoxOfficeMovieModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBoxOfficeMovieModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBoxOfficeMovieModel&&(identical(other.rnum, rnum) || other.rnum == rnum)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.rankInten, rankInten) || other.rankInten == rankInten)&&(identical(other.rankOldAndNew, rankOldAndNew) || other.rankOldAndNew == rankOldAndNew)&&(identical(other.movieCd, movieCd) || other.movieCd == movieCd)&&(identical(other.movieNm, movieNm) || other.movieNm == movieNm)&&(identical(other.openDt, openDt) || other.openDt == openDt)&&(identical(other.salesAmt, salesAmt) || other.salesAmt == salesAmt)&&(identical(other.salesShare, salesShare) || other.salesShare == salesShare)&&(identical(other.salesInten, salesInten) || other.salesInten == salesInten)&&(identical(other.salesChange, salesChange) || other.salesChange == salesChange)&&(identical(other.salesAcc, salesAcc) || other.salesAcc == salesAcc)&&(identical(other.audiCnt, audiCnt) || other.audiCnt == audiCnt)&&(identical(other.audiInten, audiInten) || other.audiInten == audiInten)&&(identical(other.audiChange, audiChange) || other.audiChange == audiChange)&&(identical(other.audiAcc, audiAcc) || other.audiAcc == audiAcc)&&(identical(other.scrnCnt, scrnCnt) || other.scrnCnt == scrnCnt)&&(identical(other.showCnt, showCnt) || other.showCnt == showCnt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rnum,rank,rankInten,rankOldAndNew,movieCd,movieNm,openDt,salesAmt,salesShare,salesInten,salesChange,salesAcc,audiCnt,audiInten,audiChange,audiAcc,scrnCnt,showCnt);

@override
String toString() {
  return 'DailyBoxOfficeMovieModel(rnum: $rnum, rank: $rank, rankInten: $rankInten, rankOldAndNew: $rankOldAndNew, movieCd: $movieCd, movieNm: $movieNm, openDt: $openDt, salesAmt: $salesAmt, salesShare: $salesShare, salesInten: $salesInten, salesChange: $salesChange, salesAcc: $salesAcc, audiCnt: $audiCnt, audiInten: $audiInten, audiChange: $audiChange, audiAcc: $audiAcc, scrnCnt: $scrnCnt, showCnt: $showCnt)';
}


}

/// @nodoc
abstract mixin class _$DailyBoxOfficeMovieModelCopyWith<$Res> implements $DailyBoxOfficeMovieModelCopyWith<$Res> {
  factory _$DailyBoxOfficeMovieModelCopyWith(_DailyBoxOfficeMovieModel value, $Res Function(_DailyBoxOfficeMovieModel) _then) = __$DailyBoxOfficeMovieModelCopyWithImpl;
@override @useResult
$Res call({
 String? rnum, String? rank, String? rankInten, String? rankOldAndNew, String? movieCd, String? movieNm, String? openDt, String? salesAmt, String? salesShare, String? salesInten, String? salesChange, String? salesAcc, String? audiCnt, String? audiInten, String? audiChange, String? audiAcc, String? scrnCnt, String? showCnt
});




}
/// @nodoc
class __$DailyBoxOfficeMovieModelCopyWithImpl<$Res>
    implements _$DailyBoxOfficeMovieModelCopyWith<$Res> {
  __$DailyBoxOfficeMovieModelCopyWithImpl(this._self, this._then);

  final _DailyBoxOfficeMovieModel _self;
  final $Res Function(_DailyBoxOfficeMovieModel) _then;

/// Create a copy of DailyBoxOfficeMovieModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rnum = freezed,Object? rank = freezed,Object? rankInten = freezed,Object? rankOldAndNew = freezed,Object? movieCd = freezed,Object? movieNm = freezed,Object? openDt = freezed,Object? salesAmt = freezed,Object? salesShare = freezed,Object? salesInten = freezed,Object? salesChange = freezed,Object? salesAcc = freezed,Object? audiCnt = freezed,Object? audiInten = freezed,Object? audiChange = freezed,Object? audiAcc = freezed,Object? scrnCnt = freezed,Object? showCnt = freezed,}) {
  return _then(_DailyBoxOfficeMovieModel(
rnum: freezed == rnum ? _self.rnum : rnum // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,rankInten: freezed == rankInten ? _self.rankInten : rankInten // ignore: cast_nullable_to_non_nullable
as String?,rankOldAndNew: freezed == rankOldAndNew ? _self.rankOldAndNew : rankOldAndNew // ignore: cast_nullable_to_non_nullable
as String?,movieCd: freezed == movieCd ? _self.movieCd : movieCd // ignore: cast_nullable_to_non_nullable
as String?,movieNm: freezed == movieNm ? _self.movieNm : movieNm // ignore: cast_nullable_to_non_nullable
as String?,openDt: freezed == openDt ? _self.openDt : openDt // ignore: cast_nullable_to_non_nullable
as String?,salesAmt: freezed == salesAmt ? _self.salesAmt : salesAmt // ignore: cast_nullable_to_non_nullable
as String?,salesShare: freezed == salesShare ? _self.salesShare : salesShare // ignore: cast_nullable_to_non_nullable
as String?,salesInten: freezed == salesInten ? _self.salesInten : salesInten // ignore: cast_nullable_to_non_nullable
as String?,salesChange: freezed == salesChange ? _self.salesChange : salesChange // ignore: cast_nullable_to_non_nullable
as String?,salesAcc: freezed == salesAcc ? _self.salesAcc : salesAcc // ignore: cast_nullable_to_non_nullable
as String?,audiCnt: freezed == audiCnt ? _self.audiCnt : audiCnt // ignore: cast_nullable_to_non_nullable
as String?,audiInten: freezed == audiInten ? _self.audiInten : audiInten // ignore: cast_nullable_to_non_nullable
as String?,audiChange: freezed == audiChange ? _self.audiChange : audiChange // ignore: cast_nullable_to_non_nullable
as String?,audiAcc: freezed == audiAcc ? _self.audiAcc : audiAcc // ignore: cast_nullable_to_non_nullable
as String?,scrnCnt: freezed == scrnCnt ? _self.scrnCnt : scrnCnt // ignore: cast_nullable_to_non_nullable
as String?,showCnt: freezed == showCnt ? _self.showCnt : showCnt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
