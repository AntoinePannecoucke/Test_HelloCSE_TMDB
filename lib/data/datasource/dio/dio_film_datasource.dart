import 'package:flutter/cupertino.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/datasource/dio/mixin_dio_film_datasource.dart';
import 'package:test_technique_hellocse/data/source/dio/dio_film_source.dart';
import 'package:test_technique_hellocse/model/film.dart';
import 'package:test_technique_hellocse/model/film_response.dart';

class DioFilmDatasource implements MixinDioFilmDatasource {

  @override
  Future<List<Film>> getNowPlaying() async {
    FilmResponse? filmResponse;
    var response = await getItLocator<DioFilmSource>().getNowPlaying();

    if (response.data != null){
      try {
        filmResponse = FilmResponse.fromJson(response.data!);
      }
      catch (e) {
        debugPrint("ERROR : $e");
      }
    }

    return filmResponse?.results ?? [];
  }

}