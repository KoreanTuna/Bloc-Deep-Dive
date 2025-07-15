import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/on_board/data/repository/favorite_genre_repository.dart';
import 'package:door_stamp/presentation/on_board/presentation/bloc/on_board_bloc.dart';
import 'package:door_stamp/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFavoriteGenreRepository extends Mock implements FavoriteGenreRepository {}

void main() {
  late MockFavoriteGenreRepository repository;

  setUp(() {
    repository = MockFavoriteGenreRepository();
  });

  group('OnBoardBloc', () {
    blocTest<OnBoardBloc, OnBoardState>(
      'emits updated genres when a genre is selected',
      build: () => OnBoardBloc(repository),
      act: (bloc) => bloc.add(SelectGenreEvent(FavoriteGenre.action)),
      expect: () => [
        const OnBoardState(selectedGenres: [FavoriteGenre.action]),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      'emits updated genres when a genre is deselected',
      build: () => OnBoardBloc(repository),
      seed: () => const OnBoardState(selectedGenres: [FavoriteGenre.action]),
      act: (bloc) => bloc.add(DeselectGenreEvent(FavoriteGenre.action)),
      expect: () => [
        const OnBoardState(selectedGenres: []),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      'sets isSubmitted true when repository returns success',
      build: () {
        when(
          repository.saveFavoriteGenres(
            favoriteGenres: [FavoriteGenre.action],
          ),
        ).thenAnswer((_) async => const Result.ok(null));
        return OnBoardBloc(repository);
      },
      act: (bloc) =>
          bloc.add(const SubmitOnBoardEvent([FavoriteGenre.action])),
      expect: () => [
        const OnBoardState(isSubmitted: true),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      'keeps isSubmitted false when repository returns failure',
      build: () {
        when(
          repository.saveFavoriteGenres(
            favoriteGenres: [FavoriteGenre.action],
          ),
        ).thenAnswer((_) async => Result.error(Exception('fail')));
        return OnBoardBloc(repository);
      },
      act: (bloc) =>
          bloc.add(const SubmitOnBoardEvent([FavoriteGenre.action])),
      expect: () => [
        const OnBoardState(isSubmitted: false),
      ],
    );
  });
}
