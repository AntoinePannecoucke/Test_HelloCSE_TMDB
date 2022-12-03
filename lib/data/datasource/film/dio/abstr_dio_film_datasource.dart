import 'package:test_technique_hellocse/data/source/film/dio/dio_film_source.dart';
import 'package:test_technique_hellocse/model/film.dart';

abstract class AbstrDioFilmDatasource {
  DioFilmSource? source;

  Future<List<Film>> getNowPlaying();
}