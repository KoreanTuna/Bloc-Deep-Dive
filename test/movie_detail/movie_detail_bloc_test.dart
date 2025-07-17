import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/screens/movie_detail/data/repository/movie_detail_repository.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_bloc.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:door_stamp/presentation/screens/movie_detail/presentation/bloc/movie_detail_state.dart';
import 'package:door_stamp/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'movie_detail_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<MovieDetailRepository>(),
])
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    provideDummy<Result<MovieDetailModel>>(
      Result.ok(
        MovieDetailModel(
          movieInfo: MovieDetailInfoModel(
            movieCd: '',
            movieNm: '',
            movieNmEn: '',
            movieNmOg: '',
            showTm: '',
            prdtYear: '',
            openDt: '',
            prdtStatNm: '',
            typeNm: '',
            nations: const [],
            genres: const [],
            directors: const [],
            actors: const [],
            showTypes: const [],
            companys: const [],
            audits: const [],
            staffs: const [],
          ),
          source: '',
        ),
      ),
    );
  });

  group('MovieDetailBloc', () {
    late MockMovieDetailRepository repository;

    setUp(() {
      repository = MockMovieDetailRepository();
    });

    final detail = MovieDetailModel(
      movieInfo: MovieDetailInfoModel(
        movieCd: '1',
        movieNm: 'movie',
        movieNmEn: 'movie',
        movieNmOg: 'movie',
        showTm: '120',
        prdtYear: '2024',
        openDt: '20240101',
        prdtStatNm: '',
        typeNm: '',
        nations: const [],
        genres: const [],
        directors: const [],
        actors: const [],
        showTypes: const [],
        companys: const [],
        audits: const [],
        staffs: const [],
      ),
      source: 'test',
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      '[success] : 데이터 로드 성공시 상태가 success로 변경된다.',
      build: () {
        when(
          repository.getMovieDetail(movieCd: '1', forceRefresh: false),
        ).thenAnswer(
          (_) async => Result.ok(detail),
        );
        return MovieDetailBloc(movieDetailRepository: repository);
      },

      act: (bloc) => bloc.add(MovieDetailFetched(movieCd: '1')),
      expect:
          () => [
            MovieDetailState(
              status: MovieDetailStatus.success,
              movieDetail: detail,
            ),
          ],
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      '[failure] : 데이터 로드 실패시 상태가 failure로 변경된다.',
      build: () {
        when(
          repository.getMovieDetail(movieCd: '1', forceRefresh: false),
        ).thenAnswer(
          (_) async => Result.error(Exception('fail')),
        );
        return MovieDetailBloc(movieDetailRepository: repository);
      },
      act: (bloc) => bloc.add(MovieDetailFetched(movieCd: '1')),
      expect:
          () => [
            const MovieDetailState(status: MovieDetailStatus.failure),
          ],
    );
  });
}
