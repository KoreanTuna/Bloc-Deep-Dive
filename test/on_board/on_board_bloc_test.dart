import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/on_board/data/repository/favorite_genre_repository.dart';
import 'package:door_stamp/presentation/on_board/presentation/bloc/on_board_bloc.dart';
import 'package:door_stamp/util/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteGenreRepository extends Mock implements FavoriteGenreRepository {}

void main() {
  group('OnBoardBloc', () {
    late FavoriteGenreRepository repository;

    setUp(() {
      repository = MockFavoriteGenreRepository();
    });

    blocTest<OnBoardBloc, OnBoardState>(
      '[select] : 장르 선택시 리스트에 추가된다.',
      build: () => OnBoardBloc(repository),
      act: (bloc) => bloc.add(SelectGenreEvent(FavoriteGenre.action)),
      expect: () => [
        const OnBoardState(selectedGenres: [FavoriteGenre.action]),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      '[deselect] : 장르 선택 해제시 리스트에서 제거된다.',
      build: () => OnBoardBloc(repository),
      seed: () => const OnBoardState(selectedGenres: [FavoriteGenre.action]),
      act: (bloc) => bloc.add(DeselectGenreEvent(FavoriteGenre.action)),
      expect: () => [
        const OnBoardState(selectedGenres: []),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      '[submit success] : 데이터 저장 성공시 isSubmitted가 true가 된다.',
      build: () {
        when(() => repository.saveFavoriteGenres(
              favoriteGenres: [FavoriteGenre.action],
            )).thenAnswer((_) async => const Ok(null));
        return OnBoardBloc(repository);
      },
      act: (bloc) => bloc.add(SubmitOnBoardEvent([FavoriteGenre.action])),
      expect: () => [
        const OnBoardState(isSubmitted: true),
      ],
    );

    blocTest<OnBoardBloc, OnBoardState>(
      '[submit failure] : 데이터 저장 실패시 isSubmitted가 false가 된다.',
      build: () {
        when(() => repository.saveFavoriteGenres(
              favoriteGenres: [FavoriteGenre.action],
            )).thenAnswer((_) async => Result.error(Exception('error')));
        return OnBoardBloc(repository);
      },
      act: (bloc) => bloc.add(SubmitOnBoardEvent([FavoriteGenre.action])),
      expect: () => [
        const OnBoardState(isSubmitted: false),
      ],
    );
  });
}
