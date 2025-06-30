part of 'on_board_bloc.dart';

class OnBoardState extends Equatable {
  final List<FavoriteGenre> selectedGenres;
  final bool isSubmitted;

  const OnBoardState({
    this.selectedGenres = const [],
    this.isSubmitted = false,
  });

  @override
  List<Object?> get props => [selectedGenres, isSubmitted];

  OnBoardState copyWith({
    List<FavoriteGenre>? selectedGenres,
    bool? isSubmitted,
  }) {
    return OnBoardState(
      selectedGenres: selectedGenres ?? this.selectedGenres,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}
