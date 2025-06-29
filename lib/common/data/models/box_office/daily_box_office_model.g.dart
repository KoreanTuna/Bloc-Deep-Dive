// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_box_office_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyBoxOfficeModel _$DailyBoxOfficeModelFromJson(
  Map<String, dynamic> json,
) => _DailyBoxOfficeModel(
  boxofficeType: json['boxofficeType'] as String,
  showRange: json['showRange'] as String,
  dailyBoxOfficeList:
      (json['dailyBoxOfficeList'] as List<dynamic>)
          .map(
            (e) => DailyBoxOfficeMovieModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$DailyBoxOfficeModelToJson(
  _DailyBoxOfficeModel instance,
) => <String, dynamic>{
  'boxofficeType': instance.boxofficeType,
  'showRange': instance.showRange,
  'dailyBoxOfficeList': instance.dailyBoxOfficeList,
};

_DailyBoxOfficeMovieModel _$DailyBoxOfficeMovieModelFromJson(
  Map<String, dynamic> json,
) => _DailyBoxOfficeMovieModel(
  rnum: json['rnum'] as String?,
  rank: json['rank'] as String?,
  rankInten: json['rankInten'] as String?,
  rankOldAndNew: json['rankOldAndNew'] as String?,
  movieCd: json['movieCd'] as String?,
  movieNm: json['movieNm'] as String?,
  openDt: json['openDt'] as String?,
  salesAmt: json['salesAmt'] as String?,
  salesShare: json['salesShare'] as String?,
  salesInten: json['salesInten'] as String?,
  salesChange: json['salesChange'] as String?,
  salesAcc: json['salesAcc'] as String?,
  audiCnt: json['audiCnt'] as String?,
  audiInten: json['audiInten'] as String?,
  audiChange: json['audiChange'] as String?,
  audiAcc: json['audiAcc'] as String?,
  scrnCnt: json['scrnCnt'] as String?,
  showCnt: json['showCnt'] as String?,
);

Map<String, dynamic> _$DailyBoxOfficeMovieModelToJson(
  _DailyBoxOfficeMovieModel instance,
) => <String, dynamic>{
  'rnum': instance.rnum,
  'rank': instance.rank,
  'rankInten': instance.rankInten,
  'rankOldAndNew': instance.rankOldAndNew,
  'movieCd': instance.movieCd,
  'movieNm': instance.movieNm,
  'openDt': instance.openDt,
  'salesAmt': instance.salesAmt,
  'salesShare': instance.salesShare,
  'salesInten': instance.salesInten,
  'salesChange': instance.salesChange,
  'salesAcc': instance.salesAcc,
  'audiCnt': instance.audiCnt,
  'audiInten': instance.audiInten,
  'audiChange': instance.audiChange,
  'audiAcc': instance.audiAcc,
  'scrnCnt': instance.scrnCnt,
  'showCnt': instance.showCnt,
};
