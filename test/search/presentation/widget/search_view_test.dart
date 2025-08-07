import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_bloc.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_event.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_state.dart';
import 'package:door_stamp/presentation/screens/search/presentation/widget/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieSearchBloc extends MockBloc<MovieSearchEvent, MovieSearchState>
    implements MovieSearchBloc {}

void main() {
  testWidgets('renders movie list when search succeeds', (tester) async {
    final bloc = MockMovieSearchBloc();
    final movies = [
      MovieModel(id: '1', title: 'A'),
      MovieModel(id: '2', title: 'B'),
    ];
    when(() => bloc.state).thenReturn(
      MovieSearchState(status: MovieSearchStatus.success, movies: movies),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MovieSearchBloc>.value(
          value: bloc,
          child: const SearchView(),
        ),
      ),
    );

    expect(find.byType(ListTile), findsNWidgets(movies.length));
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });
}
