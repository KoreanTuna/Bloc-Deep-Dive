import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/widget/movie_default_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final info = MovieDetailInfoModel(
    movieCd: '001',
    movieNm: 'Test Movie',
    movieNmEn: 'Test Movie',
    movieNmOg: 'Test Movie',
    showTm: '123',
    prdtYear: '2024',
    openDt: '2024-01-01',
    prdtStatNm: '',
    typeNm: '',
    nations: const [],
    genres: const [],
    directors: const [],
    actors: const [],
    showTypes: const [],
    companys: [
      CompanyModel(
        companyCd: 'C1',
        companyNm: 'Company',
        companyNmEn: 'Company',
        companyPartNm: 'Producer',
      ),
    ],
    audits: const [],
    staffs: const [],
  );

  testWidgets('displays basic movie info rows', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MovieDefaultInfo(
          movieDetailInfo: info,
          prevDayTotalAudits: 1000,
        ),
      ),
    );

    expect(find.byKey(const Key('movie_default_info_release_date')), findsOneWidget);
    expect(find.byKey(const Key('movie_default_info_total_audits')), findsOneWidget);
    expect(find.byKey(const Key('movie_default_info_running_time')), findsOneWidget);
    expect(find.byKey(const Key('movie_default_info_companys')), findsOneWidget);
  });
}
