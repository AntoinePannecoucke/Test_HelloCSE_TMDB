import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/Interceptor/auth_interceptor.dart';

@Singleton(order: -3)
class DioFilmSource {

  late Dio dio;

  DioFilmSource() {
    dio = Dio();
    dio.interceptors.add(AuthInterceptor());
    dio.options.baseUrl = "https://api.themoviedb.org/3/movie";
  }

  Future<Response<Map<String, dynamic>>> getNowPlaying() async =>
      await dio.get<Map<String, dynamic>>("/now_playing", queryParameters: {"language" : "fr-FR"});

}