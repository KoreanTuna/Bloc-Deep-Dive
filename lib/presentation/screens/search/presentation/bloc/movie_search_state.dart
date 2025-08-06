import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';

enum MovieSearchStatus {
  initial,
  loading,
  success,
  failure,
}

class MovieSearchState extends Equatable {
  const MovieSearchState({
    this.status = MovieSearchStatus.initial,
    this.movies = const [],
    this.query = '',
    this.errorMessage = '',
  });

  final MovieSearchStatus status;
  final List<MovieModel> movies;
  final String query;
  final String errorMessage;

  MovieSearchState copyWith({
    MovieSearchStatus? status,
    List<MovieModel>? movies,
    String? query,
    String? errorMessage,
  }) {
    return MovieSearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      query: query ?? this.query,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, movies, query, errorMessage];
}
