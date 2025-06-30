part of 'on_board_bloc.dart';

class OnBoardState extends Equatable {
  final List<FavoriteGenre> selectedGenres;

  const OnBoardState({this.selectedGenres = const []});

  @override
  List<Object?> get props => [selectedGenres];

  OnBoardState copyWith({List<FavoriteGenre>? selectedGenres}) {
    return OnBoardState(
      selectedGenres: selectedGenres ?? this.selectedGenres,
    );
  }
}
