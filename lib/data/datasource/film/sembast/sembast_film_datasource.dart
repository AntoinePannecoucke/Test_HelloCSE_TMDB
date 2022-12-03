import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/datasource/film/sembast/abstr_sembast_film_datasource.dart';
import 'package:test_technique_hellocse/data/source/film/sembast/sembast_film_source.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Singleton(as: AbstrSembastFilmDatasource, order: -2)
class SembastFilmDatasource implements AbstrSembastFilmDatasource {

  @override
  Future<List<Film>> getFavoriteFilms() async{
    return await source?.getFavoriteFilms().then(
            (records) => records.map(
                    (record) => Film.fromJson(record.value)).toList()
    ) ?? [];

  }

  @override
  Future<void> insertFavoriteFilm(Film film) async {
    return await source?.insertFavoriteFilm(film);
  }

  @override
  Future<bool> isFavorite(String idFilm) async {
    return await source?.isFavorite(idFilm) ?? true;
  }

  @override
  Future<void> removeFavoriteFilm(String idFilm) async {
    return await source?.removeFavoriteFilm(idFilm);
  }

  @override
  SembastFilmSource? source = getItLocator<SembastFilmSource>();

}