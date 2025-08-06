import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/screens/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/screens/on_board/data/repository/favorite_genre_repository.dart';
import 'package:door_stamp/presentation/screens/on_board/presentation/bloc/on_board_bloc.dart';
import 'package:door_stamp/core/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'on_board_bloc_test.mocks.dart';

@GenerateMocks([
  FavoriteGenreRepository,
])
import 'package:mockito/mockito.dart' as mockito;

void main() {
  late MockFavoriteGenreRepository repository;

  mockito.provideDummy<Result<void>>(const Result<void>.ok(null));

  setUp(() {
    repository = MockFavoriteGenreRepository();
  });

  group('OnBoardBloc', () {
    blocTest<OnBoardBloc, OnBoardState>(
      'emits updated genres when a genre is selected',
      build: () => OnBoardBloc(repository),
      act: (bloc) => bloc.add(SelectGenreEvent(FavoriteGenre.action)),
      expect:
          () => [
            const OnBoardState(selectedGenres: [FavoriteGenre.action]),
          ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      'emits updated genres when a genre is deselected',
      build: () => OnBoardBloc(repository),
      seed: () => const OnBoardState(selectedGenres: [FavoriteGenre.action]),
      act: (bloc) => bloc.add(DeselectGenreEvent(FavoriteGenre.action)),
      expect:
          () => [
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
        ).thenAnswer((_) async => const Result<void>.ok(null));
        return OnBoardBloc(repository);
      },
      act: (bloc) => bloc.add(SubmitOnBoardEvent([FavoriteGenre.action])),
      expect:
          () => [
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
      act: (bloc) => bloc.add(SubmitOnBoardEvent([FavoriteGenre.action])),
      expect:
          () => [
            const OnBoardState(isSubmitted: false),
          ],
    );
  });
}
