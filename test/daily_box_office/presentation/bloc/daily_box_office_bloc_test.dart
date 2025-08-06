import 'package:door_stamp/environment/api_config.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/data_source/box_office_data_source.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/models/daily_box_office_request_model.dart';
import 'package:door_stamp/presentation/features/daily_box_office/data/repository/box_office_repository.dart';
import 'package:door_stamp/presentation/features/daily_box_office/presentation/bloc/daily_box_office_bloc.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'daily_box_office_bloc_test.mocks.dart';

@GenerateMocks([BoxOfficeDataSource])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BoxOfficeRepository repository;
  late MockBoxOfficeDataSource dataSource;

  setUp(() {
    dataSource = MockBoxOfficeDataSource();
    repository = BoxOfficeRepository(dataSource);

    dotenv.testLoad(
      fileInput: '''
          API_KEY=TEST_API_KEY
      ''',
    );
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
          dataSource.getDailyBoxOffice(
            DailyBoxOfficeRequestModel(
              targetDt: targetDate,
              itemPerPage: '10',
              key: ApiConfig.apiKey,
            ),
          ),
        ).thenAnswer(
          (_) async => BoxOfficeResponseModel(boxOfficeResult: boxOfficeModel),
        );

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

    blocTest(
      '[failure] : 데이터 로드에 실패하면 Status가 failure로 변경된다.',
      build: () {
        when(
          dataSource.getDailyBoxOffice(
            DailyBoxOfficeRequestModel(
              targetDt: targetDate,
              itemPerPage: '10',
              key: ApiConfig.apiKey,
            ),
          ),
        ).thenAnswer(
          (_) async => throw Exception('Failed to load data'),
        );

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
