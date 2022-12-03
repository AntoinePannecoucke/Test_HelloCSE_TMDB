import 'package:test_technique_hellocse/model/film.dart';

mixin FavoriteToggle {
  Future toggle(Film selectedFilm);

  Future<bool> isFavorite(Film film);

}