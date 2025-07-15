import 'package:door_stamp/presentation/movie_detail/data/models/movie_detail_model.dart';
import 'package:door_stamp/presentation/movie_detail/data/repository/movie_detail_repository.dart';
import 'package:door_stamp/presentation/movie_detail/presentation/bloc/movie_detail_event.dart';
import 'package:door_stamp/presentation/movie_detail/presentation/bloc/movie_detail_state.dart';
import 'package:door_stamp/util/result.dart';
import 'package:door_stamp/util/stream_transform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({required MovieDetailRepository movieDetailRepository})
    : _movieDetailRepository = movieDetailRepository,
      super(const MovieDetailState()) {
    on<MovieDetailFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final MovieDetailRepository _movieDetailRepository;

  Future<void> _onFetched(
    MovieDetailFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    final Result<MovieDetailModel> movieDetail = await _movieDetailRepository
        .getMovieDetail(movieCd: event.movieCd);

    movieDetail.when(
      ok:
          (movieDetail) => emit(
            MovieDetailState(
              status: MovieDetailStatus.success,
              movieDetail: movieDetail,
            ),
          ),
      error:
          (_) => emit(
            MovieDetailState(
              status: MovieDetailStatus.failure,
              movieDetail: null,
            ),
          ),
    );
  }
}
