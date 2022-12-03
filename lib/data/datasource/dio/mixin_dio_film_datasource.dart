import 'package:test_technique_hellocse/model/film.dart';

mixin MixinDioFilmDatasource {
  Future<List<Film>> getNowPlaying();
}