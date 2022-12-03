import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Film {
  int id;
  String title;
  @JsonKey(name : "poster_path")
  String? poster;
  String overview;
  @JsonKey(name : "release_date")
  String release;

  Film({
    required this.id,
    required this.title,
    this.poster,
    required this.overview,
    required this.release
  });

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);

}