import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/datasource/film/dio/abstr_dio_film_datasource.dart';
import 'package:test_technique_hellocse/data/source/film/dio/dio_film_source.dart';
import 'package:test_technique_hellocse/model/film.dart';
import 'package:test_technique_hellocse/model/film_response.dart';

@Singleton(as: AbstrDioFilmDatasource, order: -2)
class DioFilmDatasource implements AbstrDioFilmDatasource {

  @override
  Future<List<Film>> getNowPlaying() async {
    FilmResponse? filmResponse;
    var response = await source?.getNowPlaying();

    if (response?.data != null){
      try {
        filmResponse = FilmResponse.fromJson(response!.data!);
      }
      catch (e) {
        debugPrint("ERROR : $e");
      }
    }

    return filmResponse?.results ?? [];
  }

  @override
  DioFilmSource? source = getItLocator<DioFilmSource>();

}