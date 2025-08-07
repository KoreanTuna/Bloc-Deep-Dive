import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:door_stamp/presentation/screens/search/data/models/movie_model.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_bloc.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_event.dart';
import 'package:door_stamp/presentation/screens/search/presentation/bloc/movie_search_state.dart';
import 'package:door_stamp/presentation/screens/search/presentation/widget/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieSearchBloc extends MockBloc<MovieSearchEvent, MovieSearchState>
    implements MovieSearchBloc {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMessageHandler('flutter/assets', (message) async {
      final key = utf8.decoder.convert(message!.buffer.asUint8List());
      if (key.endsWith('.svg')) {
        final bytes = Uint8List.fromList(
            '<svg xmlns="http://www.w3.org/2000/svg"></svg>'.codeUnits);
        return bytes.buffer.asByteData();
      }
      return ByteData(0);
    });
  });

  testWidgets('renders movie list when search succeeds', (tester) async {
    final bloc = MockMovieSearchBloc();
    final movies = [
      MovieModel(id: '1', title: 'A'),
      MovieModel(id: '2', title: 'B'),
    ];
    final state =
        MovieSearchState(status: MovieSearchStatus.success, movies: movies);
    when(() => bloc.state).thenReturn(state);
    whenListen(bloc, Stream<MovieSearchState>.fromIterable([state]));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MovieSearchBloc>.value(
          value: bloc,
          child: const SearchView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsNWidgets(movies.length));
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });
}
