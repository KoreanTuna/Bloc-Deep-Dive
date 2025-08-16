import 'package:door_stamp/presentation/screens/on_board/data/models/favorite_genre_model.dart';
import 'package:door_stamp/presentation/screens/on_board/presentation/widget/genre_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows genre text and reacts to tap', (tester) async {
    FavoriteGenre? tapped;
    await tester.pumpWidget(
      MaterialApp(
        home: GenreCard(
          genre: FavoriteGenre.action,
          isSelected: false,
          onTap: (genre) => tapped = genre,
        ),
      ),
    );

    expect(find.text(FavoriteGenre.action.korean), findsOneWidget);
    await tester.tap(find.byKey(Key(FavoriteGenre.action.korean)));
    await tester.pumpAndSettle();
    expect(tapped, FavoriteGenre.action);
  });
}
