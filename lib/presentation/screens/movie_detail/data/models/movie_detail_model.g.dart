// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailResponseModel _$MovieDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => _MovieDetailResponseModel(
  movieInfoResult: MovieDetailModel.fromJson(
    json['movieInfoResult'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MovieDetailResponseModelToJson(
  _MovieDetailResponseModel instance,
) => <String, dynamic>{'movieInfoResult': instance.movieInfoResult};

_MovieDetailInfoModel _$MovieDetailInfoModelFromJson(
  Map<String, dynamic> json,
) => _MovieDetailInfoModel(
  movieCd: json['movieCd'] as String,
  movieNm: json['movieNm'] as String,
  movieNmEn: json['movieNmEn'] as String,
  movieNmOg: json['movieNmOg'] as String,
  showTm: json['showTm'] as String,
  prdtYear: json['prdtYear'] as String,
  openDt: json['openDt'] as String,
  prdtStatNm: json['prdtStatNm'] as String,
  typeNm: json['typeNm'] as String,
  nations:
      (json['nations'] as List<dynamic>)
          .map((e) => NationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  genres:
      (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  directors:
      (json['directors'] as List<dynamic>)
          .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  actors:
      (json['actors'] as List<dynamic>)
          .map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  showTypes:
      (json['showTypes'] as List<dynamic>)
          .map((e) => ShowTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  companys:
      (json['companys'] as List<dynamic>)
          .map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  audits:
      (json['audits'] as List<dynamic>)
          .map((e) => AuditModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  staffs:
      (json['staffs'] as List<dynamic>)
          .map((e) => StaffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MovieDetailInfoModelToJson(
  _MovieDetailInfoModel instance,
) => <String, dynamic>{
  'movieCd': instance.movieCd,
  'movieNm': instance.movieNm,
  'movieNmEn': instance.movieNmEn,
  'movieNmOg': instance.movieNmOg,
  'showTm': instance.showTm,
  'prdtYear': instance.prdtYear,
  'openDt': instance.openDt,
  'prdtStatNm': instance.prdtStatNm,
  'typeNm': instance.typeNm,
  'nations': instance.nations,
  'genres': instance.genres,
  'directors': instance.directors,
  'actors': instance.actors,
  'showTypes': instance.showTypes,
  'companys': instance.companys,
  'audits': instance.audits,
  'staffs': instance.staffs,
};

_MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    _MovieDetailModel(
      movieInfo: MovieDetailInfoModel.fromJson(
        json['movieInfo'] as Map<String, dynamic>,
      ),
      source: json['source'] as String,
    );

Map<String, dynamic> _$MovieDetailModelToJson(_MovieDetailModel instance) =>
    <String, dynamic>{
      'movieInfo': instance.movieInfo,
      'source': instance.source,
    };

_NationModel _$NationModelFromJson(Map<String, dynamic> json) =>
    _NationModel(nationNm: json['nationNm'] as String);

Map<String, dynamic> _$NationModelToJson(_NationModel instance) =>
    <String, dynamic>{'nationNm': instance.nationNm};

_GenreModel _$GenreModelFromJson(Map<String, dynamic> json) =>
    _GenreModel(genreNm: json['genreNm'] as String);

Map<String, dynamic> _$GenreModelToJson(_GenreModel instance) =>
    <String, dynamic>{'genreNm': instance.genreNm};

_PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) => _PeopleModel(
  peopleNm: json['peopleNm'] as String,
  peopleNmEn: json['peopleNmEn'] as String,
  cast: json['cast'] as String?,
  castEn: json['castEn'] as String?,
);

Map<String, dynamic> _$PeopleModelToJson(_PeopleModel instance) =>
    <String, dynamic>{
      'peopleNm': instance.peopleNm,
      'peopleNmEn': instance.peopleNmEn,
      'cast': instance.cast,
      'castEn': instance.castEn,
    };

_ShowTypeModel _$ShowTypeModelFromJson(Map<String, dynamic> json) =>
    _ShowTypeModel(
      showTypeGroupNm: json['showTypeGroupNm'] as String,
      showTypeNm: json['showTypeNm'] as String,
    );

Map<String, dynamic> _$ShowTypeModelToJson(_ShowTypeModel instance) =>
    <String, dynamic>{
      'showTypeGroupNm': instance.showTypeGroupNm,
      'showTypeNm': instance.showTypeNm,
    };

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    _CompanyModel(
      companyCd: json['companyCd'] as String,
      companyNm: json['companyNm'] as String,
      companyNmEn: json['companyNmEn'] as String,
      companyPartNm: json['companyPartNm'] as String,
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'companyCd': instance.companyCd,
      'companyNm': instance.companyNm,
      'companyNmEn': instance.companyNmEn,
      'companyPartNm': instance.companyPartNm,
    };

_AuditModel _$AuditModelFromJson(Map<String, dynamic> json) => _AuditModel(
  auditNo: json['auditNo'] as String,
  watchGradeNm: json['watchGradeNm'] as String,
);

Map<String, dynamic> _$AuditModelToJson(_AuditModel instance) =>
    <String, dynamic>{
      'auditNo': instance.auditNo,
      'watchGradeNm': instance.watchGradeNm,
    };

_StaffModel _$StaffModelFromJson(Map<String, dynamic> json) => _StaffModel(
  peopleNm: json['peopleNm'] as String,
  peopleNmEn: json['peopleNmEn'] as String,
  staffRoleNm: json['staffRoleNm'] as String?,
);

Map<String, dynamic> _$StaffModelToJson(_StaffModel instance) =>
    <String, dynamic>{
      'peopleNm': instance.peopleNm,
      'peopleNmEn': instance.peopleNmEn,
      'staffRoleNm': instance.staffRoleNm,
    };
