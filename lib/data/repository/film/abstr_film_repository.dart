import 'package:test_technique_hellocse/model/film.dart';

abstract class AbstrFilmRepository {
  Future<List<Film>> getNowPlaying();
  Future<void> insertFavoriteFilm(Film film);
  Future<void> removeFavoriteFilm(String idFilm);
  Future<bool> isFavorite(String idFilm);
  Future<List<Film>> getFavoriteFilms();
}