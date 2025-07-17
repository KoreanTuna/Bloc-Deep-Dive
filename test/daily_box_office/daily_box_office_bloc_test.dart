import 'package:door_stamp/presentation/features/daily_box_office/data/data_source/box_office_data_source.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/repository/box_office_repository.dart';
import 'package:door_stamp/presentation/features/daily_box_office/presentation/bloc/daily_box_office_bloc.dart';
import 'package:door_stamp/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'daily_box_office_bloc_test.mocks.dart';

@GenerateMocks([
  BoxOfficeRepository,
  BoxOfficeDataSource,
])
void main() {
  late MockBoxOfficeRepository repository;
  late MockBoxOfficeDataSource dataSource;

  setUp(() {
    repository = MockBoxOfficeRepository();
    dataSource = MockBoxOfficeDataSource();
  });

  provideDummy<Result<DailyBoxOfficeModel>>(
    Result.ok(
      const DailyBoxOfficeModel(
        dailyBoxOfficeList: [],
        boxofficeType: '',
        showRange: '',
      ),
    ),
  );

  group('DailyBoxOfficeBloc', () {
    const targetDate = '20250714';

    final boxOfficeModel = DailyBoxOfficeModel(
      dailyBoxOfficeList: [
        DailyBoxOfficeMovieModel(rank: '2', movieNm: 'Movie B'),
        DailyBoxOfficeMovieModel(rank: '1', movieNm: 'Movie A'),
        DailyBoxOfficeMovieModel(rank: '3', movieNm: 'Movie C'),
      ],
      boxofficeType: '',
      showRange: '',
    );

    blocTest<DailyBoxOfficeBloc, DailyBoxOfficeState>(
      '[success] : 데이터가 정상적으로 로드되면 Status가 success로 변경되고, 영화목록이 정렬되어 제공된다.',
      build: () {
        when(
          repository.getDailyBoxOffice(
            targetDt: targetDate,
            itemPerPage: '10',
          ),
        ).thenAnswer((_) async => Result.ok(boxOfficeModel));

        return DailyBoxOfficeBloc(boxOfficeRepository: repository);
      },
      act: (bloc) => bloc.add(DailyBoxOfficeFetched(targetDt: targetDate)),
      expect:
          () => [
            DailyBoxOfficeState(
              status: DailyBoxOfficeStatus.success,
              boxOffices: [
                DailyBoxOfficeMovieModel(rank: '1', movieNm: 'Movie A'),
                DailyBoxOfficeMovieModel(rank: '2', movieNm: 'Movie B'),
                DailyBoxOfficeMovieModel(rank: '3', movieNm: 'Movie C'),
              ],
            ),
          ],
    );

    test('[success] 캐시 생성 이후 데이터 fetching를 하지 않는지 테스트', () async {
      when(
        repository.getDailyBoxOffice(targetDt: any, itemPerPage: any),
      ).thenAnswer((_) async => Result.ok(boxOfficeModel));

      final result1 = await repository.getDailyBoxOffice(targetDt: '20250714');
      expect(result1 is Ok<DailyBoxOfficeModel>, true);
      verify(
        repository.getDailyBoxOffice(targetDt: any, itemPerPage: any),
      ).called(1);

      final result2 = await repository.getDailyBoxOffice(targetDt: '20250714');
      expect(result2 is Ok<DailyBoxOfficeModel>, true);
      verifyNever(
        dataSource.getDailyBoxOffice(any),
      );
    });

    test('[success] 캐시 생성 이후 refresh로 데이터 fetching을 하는지 테스트', () async {
      when(
        repository.getDailyBoxOffice(targetDt: any, itemPerPage: any),
      ).thenAnswer((_) async => Result.ok(boxOfficeModel));

      final result1 = await repository.getDailyBoxOffice(
        targetDt: '20250714',
        isRefresh: true,
      );
      expect(result1 is Ok<DailyBoxOfficeModel>, true);
      verify(
        repository.getDailyBoxOffice(targetDt: any, itemPerPage: any),
      ).called(1);

      final result2 = await repository.getDailyBoxOffice(
        targetDt: '20250714',
        isRefresh: true,
      );
      expect(result2 is Ok<DailyBoxOfficeModel>, true);
      verify(
        dataSource.getDailyBoxOffice(any),
      ).called(1);
    });

    blocTest(
      '[failure] : 데이터 로드에 실패하면 Status가 failure로 변경된다.',
      build: () {
        when(
          repository.getDailyBoxOffice(
            targetDt: targetDate,
            itemPerPage: '10',
          ),
        ).thenAnswer((_) async => Result.error(Exception('Error')));

        return DailyBoxOfficeBloc(boxOfficeRepository: repository);
      },
      act: (bloc) => bloc.add(DailyBoxOfficeFetched(targetDt: targetDate)),
      expect:
          () => [
            DailyBoxOfficeState(
              status: DailyBoxOfficeStatus.failure,
              boxOffices: [],
            ),
          ],
    );
  });
}
