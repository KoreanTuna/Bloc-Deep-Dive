import 'package:bloc_deep_dive/presentation/on_board/data/models/favorite_genre_model.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.favoriteGenres,
  });

  final String id;
  final String name;
  final List<FavoriteGenre> favoriteGenres;

  User copyWith({
    String? id,
    String? name,
    List<FavoriteGenre>? favoriteGenres,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      favoriteGenres: favoriteGenres ?? this.favoriteGenres,
    );
  }

  @override
  List<Object> get props => [id, name, favoriteGenres];

  static const empty = User(id: '-', name: '-', favoriteGenres: []);
}
