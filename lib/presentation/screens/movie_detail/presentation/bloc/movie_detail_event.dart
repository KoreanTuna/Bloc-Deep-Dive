import 'package:equatable/equatable.dart';

class MovieDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class MovieDetailFetched extends MovieDetailEvent {
  final String movieCd;

  MovieDetailFetched({required this.movieCd});

  @override
  List<Object> get props => [movieCd];
}
