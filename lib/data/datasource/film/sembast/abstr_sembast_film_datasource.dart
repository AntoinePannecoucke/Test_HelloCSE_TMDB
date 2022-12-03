import 'package:test_technique_hellocse/data/source/film/sembast/sembast_film_source.dart';
import 'package:test_technique_hellocse/model/film.dart';

abstract class AbstrSembastFilmDatasource {

  SembastFilmSource? source;

  Future<void> insertFavoriteFilm(Film film);
  Future<void> removeFavoriteFilm(String idFilm);
  Future<bool> isFavorite(String idFilm);
  Future<List<Film>> getFavoriteFilms();
}