part of 'on_board_bloc.dart';

class OnBoardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectGenreEvent extends OnBoardEvent {
  final FavoriteGenre genre;

  SelectGenreEvent(this.genre);

  @override
  List<Object?> get props => [genre];
}

class DeselectGenreEvent extends OnBoardEvent {
  final FavoriteGenre genre;

  DeselectGenreEvent(this.genre);

  @override
  List<Object?> get props => [genre];
}

class SubmitOnBoardEvent extends OnBoardEvent {
  SubmitOnBoardEvent();

  @override
  List<Object?> get props => [];
}
