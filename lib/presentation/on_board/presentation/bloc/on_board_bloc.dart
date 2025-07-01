import 'package:bloc_deep_dive/common/data/repository/user_repository.dart';
import 'package:bloc_deep_dive/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_board_event.dart';
part 'on_board_state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  OnBoardBloc(this._userRepository) : super(const OnBoardState()) {
    on<SelectGenreEvent>(_onSelectGenre);
    on<DeselectGenreEvent>(_onDeselectGenre);
    on<SubmitOnBoardEvent>(_onSubmitOnBoard);
  }

  final UserRepository _userRepository;

  void _onSelectGenre(SelectGenreEvent event, Emitter<OnBoardState> emit) {
    final updatedGenres = List<FavoriteGenre>.from(state.selectedGenres)
      ..add(event.genre);
    emit(state.copyWith(selectedGenres: updatedGenres));
  }

  void _onDeselectGenre(DeselectGenreEvent event, Emitter<OnBoardState> emit) {
    final updatedGenres = List<FavoriteGenre>.from(state.selectedGenres)
      ..remove(event.genre);
    emit(state.copyWith(selectedGenres: updatedGenres));
  }

  void _onSubmitOnBoard(
    SubmitOnBoardEvent event,
    Emitter<OnBoardState> emit,
  ) async {
    await _userRepository.saveFavoriteGenres(event.selectedGenres);
    emit(state.copyWith(isSubmitted: true));
  }
}
