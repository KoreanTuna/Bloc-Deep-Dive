import 'package:bloc_deep_dive/presentation/movie_detail/data/models/movie_detail_model.dart';
import 'package:equatable/equatable.dart';

enum MovieDetailStatus {
  initial,
  success,
  failure,
}

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.movieDetail,
  });

  final MovieDetailStatus status;
  final MovieDetailModel? movieDetail;

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetailModel? movieDetail,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movieDetail: movieDetail ?? this.movieDetail,
    );
  }

  @override
  List<Object?> get props => [status, movieDetail];
}
