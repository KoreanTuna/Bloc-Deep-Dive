import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:door_stamp/presentation/screens/search/data/repository/movie_search_repository.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_bloc.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_event.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieSearchRepository extends Mock implements MovieSearchRepository {}

void main() {
  group('MovieSearchBloc', () {
    late MovieSearchRepository repository;

    setUp(() {
      repository = MockMovieSearchRepository();
    });

    const tQuery = 'mo';
    final movies = [
      MovieModel(id: '1', title: 'Movie One'),
      MovieModel(id: '2', title: 'Movie Two'),
    ];

    blocTest<MovieSearchBloc, MovieSearchState>(
      '[success] : 검색이 성공하면 상태가 success로 변경된다.',
      build: () {
        when(() => repository.searchMovies(query: tQuery))
            .thenAnswer((_) async => Result.ok(movies));
        return MovieSearchBloc(movieSearchRepository: repository);
      },
      act: (bloc) => bloc.add(const MovieSearchQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 350),
      expect: () => [
        const MovieSearchState(
          status: MovieSearchStatus.loading,
          query: tQuery,
        ),
        MovieSearchState(
          status: MovieSearchStatus.success,
          movies: movies,
          query: tQuery,
        ),
      ],
    );

    blocTest<MovieSearchBloc, MovieSearchState>(
      '[failure] : 검색이 실패하면 상태가 failure로 변경된다.',
      build: () {
        when(() => repository.searchMovies(query: tQuery))
            .thenAnswer((_) async => Result.error(Exception('error')));
        return MovieSearchBloc(movieSearchRepository: repository);
      },
      act: (bloc) => bloc.add(const MovieSearchQueryChanged(tQuery)),
      wait: const Duration(milliseconds: 350),
      expect: () => [
        const MovieSearchState(
          status: MovieSearchStatus.loading,
          query: tQuery,
        ),
        MovieSearchState(
          status: MovieSearchStatus.failure,
          movies: [],
          query: tQuery,
          errorMessage: 'Exception: error',
        ),
      ],
    );

    blocTest<MovieSearchBloc, MovieSearchState>(
      '[clear] : MovieSearchClear 이벤트가 발생하면 초기 상태로 변경된다.',
      build: () => MovieSearchBloc(movieSearchRepository: repository),
      seed: () => MovieSearchState(
        status: MovieSearchStatus.success,
        movies: movies,
        query: tQuery,
      ),
      act: (bloc) => bloc.add(const MovieSearchClear()),
      expect: () => [const MovieSearchState()],
    );
  });
}

