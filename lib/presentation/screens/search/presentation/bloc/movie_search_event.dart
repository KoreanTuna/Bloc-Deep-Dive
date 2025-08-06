import 'package:equatable/equatable.dart';

sealed class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();

  @override
  List<Object?> get props => [];
}

final class MovieSearchQueryChanged extends MovieSearchEvent {
  const MovieSearchQueryChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class MovieSearchLoadMore extends MovieSearchEvent {
  const MovieSearchLoadMore(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class MovieSearchClear extends MovieSearchEvent {
  const MovieSearchClear();

  @override
  List<Object?> get props => [];
}

final class MovieSearchError extends MovieSearchEvent {
  const MovieSearchError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
