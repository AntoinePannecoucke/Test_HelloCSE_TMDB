import 'package:json_annotation/json_annotation.dart';
import 'package:test_technique_hellocse/model/film.dart';

part 'film_response.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class FilmResponse {
  List<Film> results;

  FilmResponse({
    required this.results
  });

  factory FilmResponse.fromJson(Map<String, dynamic> json) => _$FilmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilmResponseToJson(this);
}