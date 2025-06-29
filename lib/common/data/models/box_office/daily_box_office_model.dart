import 'package:freezed_annotation/freezed_annotation.dart';
part 'daily_box_office_model.g.dart';
part 'daily_box_office_model.freezed.dart';

@freezed
abstract class DailyBoxOfficeModel with _$DailyBoxOfficeModel {
  const factory DailyBoxOfficeModel({
    /// 박스오피스 종류를 출력합니다.
    required String boxofficeType,

    /// 박스오피스 조회 일자를 출력합니다.
    required String showRange,

    /// 일별 박스오피스 영화 목록
    required List<DailyBoxOfficeMovieModel> dailyBoxOfficeList,
  }) = _DailyBoxOfficeModel;

  factory DailyBoxOfficeModel.fromJson(Map<String, dynamic> json) =>
      _$DailyBoxOfficeModelFromJson(json);
}

@freezed
abstract class DailyBoxOfficeMovieModel with _$DailyBoxOfficeMovieModel {
  factory DailyBoxOfficeMovieModel({
    /// 순번을 출력합니다.
    String? rnum,

    /// 해당일자의 박스오피스 순위를 출력합니다.
    String? rank,

    /// 전일대비 순위의 증감분을 출력합니다.
    String? rankInten,

    /// 랭킹에 신규진입여부를 출력합니다.
    String? rankOldAndNew,

    /// 영화의 대표코드를 출력합니다.
    String? movieCd,

    /// 영화명(국문)을 출력합니다.
    String? movieNm,

    /// 영화의 개봉일을 출력합니다.
    String? openDt,

    /// 해당일의 매출액을 출력합니다.
    String? salesAmt,

    /// 해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
    String? salesShare,

    /// 전일 대비 매출액 증감분을 출력합니다.
    String? salesInten,

    /// 전일 대비 매출액 증감 비율을 출력합니다.
    String? salesChange,

    /// 누적매출액을 출력합니다.
    String? salesAcc,

    /// 해당일의 관객수를 출력합니다.
    String? audiCnt,

    /// 전일 대비 관객수 증감분을 출력합니다.
    String? audiInten,

    /// 전일 대비 관객수 증감 비율을 출력합니다.
    String? audiChange,

    /// 누적관객수를 출력합니다.
    String? audiAcc,

    /// 해당일자에 상영한 스크린수를 출력합니다.
    String? scrnCnt,

    /// 해당일자에 상영된 횟수를 출력합니다.
    String? showCnt,
  }) = _DailyBoxOfficeMovieModel;
  factory DailyBoxOfficeMovieModel.fromJson(Map<String, dynamic> json) =>
      _$DailyBoxOfficeMovieModelFromJson(json);
}
