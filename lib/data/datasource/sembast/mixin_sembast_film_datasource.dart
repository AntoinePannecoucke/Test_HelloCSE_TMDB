import 'package:test_technique_hellocse/model/film.dart';

mixin MixinSembastFilmDatasource {
  Future<void> insertFavoriteFilm(Film film);
  Future<void> removeFavoriteFilm(String idFilm);
  Future<bool> isFavorite(String idFilm);
  Future<List<Film>> getFavoriteFilms();
}