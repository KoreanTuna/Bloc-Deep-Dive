import 'package:door_stamp/core/util/debounce.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:door_stamp/presentation/screens/search/data/repository/movie_search_repository.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_event.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  MovieSearchBloc({
    required MovieSearchRepository movieSearchRepository,
  }) : _movieSearchRepository = movieSearchRepository,
       super(const MovieSearchState()) {
    on<MovieSearchQueryChanged>(
      _onQueryChanged,
      transformer: debounceDroppable(const Duration(milliseconds: 300)),
    );
    on<MovieSearchLoadMore>(
      (event, emit) {
        // Handle load more logic here if needed
      },
      transformer: debounceDroppable(const Duration(milliseconds: 300)),
    );
    on<MovieSearchClear>(
      (event, emit) {
        emit(
          state.copyWith(
            status: MovieSearchStatus.initial,
            movies: [],
            query: '',
          ),
        );
      },
    );
    on<MovieSearchError>(
      (event, emit) {
        emit(
          state.copyWith(
            status: MovieSearchStatus.failure,
            movies: [],
            errorMessage: event.error,
          ),
        );
      },
    );
  }

  final MovieSearchRepository _movieSearchRepository;

  Future<void> _onQueryChanged(
    MovieSearchQueryChanged event,
    Emitter<MovieSearchState> emit,
  ) async {
    emit(state.copyWith(status: MovieSearchStatus.loading, query: event.query));

    final Result<List<MovieModel>> result = await _movieSearchRepository
        .searchMovies(query: event.query);

    result.when(
      ok: (movies) {
        emit(
          state.copyWith(
            status: MovieSearchStatus.success,
            movies: movies,
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(
            status: MovieSearchStatus.failure,
            errorMessage: error.toString(),
            movies: [],
          ),
        );
        add(MovieSearchError(error.toString()));
      },
    );
  }
}
