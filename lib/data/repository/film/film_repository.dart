import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/datasource/film/dio/abstr_dio_film_datasource.dart';
import 'package:test_technique_hellocse/data/datasource/film/sembast/abstr_sembast_film_datasource.dart';
import 'package:test_technique_hellocse/data/repository/film/abstr_film_repository.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Singleton(as: AbstrFilmRepository)
class FilmRepository implements AbstrFilmRepository {
  @override
  Future<List<Film>> getFavoriteFilms() async =>
    await getItLocator<AbstrSembastFilmDatasource>().getFavoriteFilms();

  @override
  Future<List<Film>> getNowPlaying() async =>
      await getItLocator<AbstrDioFilmDatasource>().getNowPlaying();

  @override
  Future<void> insertFavoriteFilm(Film film) async =>
     await getItLocator<AbstrSembastFilmDatasource>().insertFavoriteFilm(film);

  @override
  Future<bool> isFavorite(String idFilm) async =>
      await getItLocator<AbstrSembastFilmDatasource>().isFavorite(idFilm);

  @override
  Future<void> removeFavoriteFilm(String idFilm) async =>
    await getItLocator<AbstrSembastFilmDatasource>().removeFavoriteFilm(idFilm);

}