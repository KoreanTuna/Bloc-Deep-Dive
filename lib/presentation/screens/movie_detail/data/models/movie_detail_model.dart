import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_detail_model.g.dart';
part 'movie_detail_model.freezed.dart';

@freezed
abstract class MovieDetailResponseModel with _$MovieDetailResponseModel {
  factory MovieDetailResponseModel({
    required MovieDetailModel movieInfoResult,
  }) = _MovieDetailResponseModel;

  factory MovieDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseModelFromJson(json);
}

@freezed
abstract class MovieDetailInfoModel with _$MovieDetailInfoModel {
  factory MovieDetailInfoModel({
    required String movieCd,
    required String movieNm,
    required String movieNmEn,
    required String movieNmOg,
    required String showTm,
    required String prdtYear,
    required String openDt,
    required String prdtStatNm,
    required String typeNm,
    required List<NationModel> nations,
    required List<GenreModel> genres,
    required List<PeopleModel> directors,
    required List<PeopleModel> actors,
    required List<ShowTypeModel> showTypes,
    required List<CompanyModel> companys,
    required List<AuditModel> audits,
    required List<StaffModel> staffs,
  }) = _MovieDetailInfoModel;

  factory MovieDetailInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailInfoModelFromJson(json);
}

@freezed
abstract class MovieDetailModel with _$MovieDetailModel {
  factory MovieDetailModel({
    required MovieDetailInfoModel movieInfo,
    required String source,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

@freezed
abstract class NationModel with _$NationModel {
  factory NationModel({
    required String nationNm,
  }) = _NationModel;
  factory NationModel.fromJson(Map<String, dynamic> json) =>
      _$NationModelFromJson(json);
}

@freezed
abstract class GenreModel with _$GenreModel {
  factory GenreModel({
    required String genreNm,
  }) = _GenreModel;
  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}

@freezed
abstract class PeopleModel with _$PeopleModel {
  factory PeopleModel({
    required String peopleNm,
    required String peopleNmEn,
    String? cast,
    String? castEn,
  }) = _PeopleModel;
  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);
}

@freezed
abstract class ShowTypeModel with _$ShowTypeModel {
  factory ShowTypeModel({
    required String showTypeGroupNm,
    required String showTypeNm,
  }) = _ShowTypeModel;
  factory ShowTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ShowTypeModelFromJson(json);
}

@freezed
abstract class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    required String companyCd,
    required String companyNm,
    required String companyNmEn,
    required String companyPartNm,
  }) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

@freezed
abstract class AuditModel with _$AuditModel {
  factory AuditModel({
    required String auditNo,
    required String watchGradeNm,
  }) = _AuditModel;
  factory AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);
}

@freezed
abstract class StaffModel with _$StaffModel {
  factory StaffModel({
    required String peopleNm,
    required String peopleNmEn,
    String? staffRoleNm,
  }) = _StaffModel;
  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);
}
