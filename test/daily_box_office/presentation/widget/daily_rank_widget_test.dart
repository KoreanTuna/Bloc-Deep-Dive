import 'dart:typed_data';

import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/presentation/widget/daily_rank_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (_) async => ByteData(0));
  });

  final movies = [
    DailyBoxOfficeMovieModel(
      movieCd: '1',
      movieNm: 'Movie 1',
      openDt: '2024-01-01',
      audiCnt: '100',
    ),
    DailyBoxOfficeMovieModel(
      movieCd: '2',
      movieNm: 'Movie 2',
      openDt: '2024-01-02',
      audiCnt: '200',
    ),
    DailyBoxOfficeMovieModel(
      movieCd: '3',
      movieNm: 'Movie 3',
      openDt: '2024-01-03',
      audiCnt: '300',
    ),
    DailyBoxOfficeMovieModel(
      movieCd: '4',
      movieNm: 'Movie 4',
      openDt: '2024-01-04',
      audiCnt: '400',
    ),
  ];

  testWidgets('renders movie titles and handles tap', (tester) async {
    String? selectedId;
    await tester.pumpWidget(
      MaterialApp(
        home: DailyRankWidget(
          dailyBoxOfficeMovieList: movies,
          onMovieSelected: (movieCd) {
            selectedId = movieCd;
          },
        ),
      ),
    );

    for (final movie in movies) {
      expect(find.text(movie.movieNm ?? ''), findsOneWidget);
    }

    await tester.tap(find.byKey(const ValueKey('1')));
    await tester.pumpAndSettle();
    expect(selectedId, '1');
  });
}
