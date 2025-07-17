import 'package:door_stamp/presentation/screens/login/bloc/login_bloc.dart';
import 'package:door_stamp/presentation/screens/on_board/data/models/favorite_genre_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    this.provider,
    required this.email,
    required this.accessToken,
    this.favoriteGenres,
    this.createdAt,
    this.updatedAt,
  });

  /// UserCredential UID
  final String id;
  final String name;

  /// 사용자 로그인 제공자
  /// ex) Google, Apple, KaKao.
  final SSOType? provider;

  final String email;
  final String accessToken;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// 사용자가 온보딩과정에서 선택한 장르
  final List<FavoriteGenre>? favoriteGenres;

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? accessToken,
    SSOType? provider,
    List<FavoriteGenre>? favoriteGenres,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      provider: provider ?? this.provider,
      favoriteGenres: favoriteGenres ?? this.favoriteGenres,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  List<Object> get props => [id, name, email, accessToken];

  static const empty = UserModel(
    id: '-',
    name: '-',
    favoriteGenres: [],
    email: '-',
    accessToken: '-',
  );
}
