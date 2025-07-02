// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  provider: $enumDecodeNullable(_$SSOTypeEnumMap, json['provider']),
  email: json['email'] as String,
  accessToken: json['accessToken'] as String,
  favoriteGenres:
      (json['favoriteGenres'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FavoriteGenreEnumMap, e))
          .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'provider': _$SSOTypeEnumMap[instance.provider],
  'email': instance.email,
  'accessToken': instance.accessToken,
  'favoriteGenres':
      instance.favoriteGenres?.map((e) => _$FavoriteGenreEnumMap[e]!).toList(),
};

const _$SSOTypeEnumMap = {
  SSOType.apple: 'apple',
  SSOType.google: 'google',
  SSOType.kakao: 'kakao',
};

const _$FavoriteGenreEnumMap = {
  FavoriteGenre.action: 'action',
  FavoriteGenre.comedy: 'comedy',
  FavoriteGenre.drama: 'drama',
  FavoriteGenre.horror: 'horror',
  FavoriteGenre.romance: 'romance',
  FavoriteGenre.sciFi: 'sciFi',
  FavoriteGenre.thriller: 'thriller',
  FavoriteGenre.fantasy: 'fantasy',
  FavoriteGenre.animation: 'animation',
  FavoriteGenre.documentary: 'documentary',
  FavoriteGenre.mystery: 'mystery',
  FavoriteGenre.adventure: 'adventure',
  FavoriteGenre.crime: 'crime',
  FavoriteGenre.historical: 'historical',
  FavoriteGenre.musical: 'musical',
  FavoriteGenre.western: 'western',
  FavoriteGenre.war: 'war',
  FavoriteGenre.family: 'family',
  FavoriteGenre.sports: 'sports',
};
