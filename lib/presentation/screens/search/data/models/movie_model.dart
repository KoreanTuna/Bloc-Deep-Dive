import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.g.dart';
part 'movie_model.freezed.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  factory MovieModel({
    required String id,
    required String title,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
