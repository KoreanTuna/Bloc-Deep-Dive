import 'package:door_stamp/presentation/screens/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/screens/on_board/data/repository/favorite_genre_repository.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_board_event.dart';
part 'on_board_state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  OnBoardBloc(this._favoriteGenreRepository) : super(const OnBoardState()) {
    on<SelectGenreEvent>(_onSelectGenre);
    on<DeselectGenreEvent>(_onDeselectGenre);
    on<SubmitOnBoardEvent>(_onSubmitOnBoard);
  }

  final FavoriteGenreRepository _favoriteGenreRepository;

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
    final Result<void> saveResult = await _favoriteGenreRepository
        .saveFavoriteGenres(
          favoriteGenres: event.selectedGenres,
        );

    if (saveResult is Ok<void>) {
      emit(state.copyWith(isSubmitted: true));
    } else {
      emit(state.copyWith(isSubmitted: false));
    }
  }
}
