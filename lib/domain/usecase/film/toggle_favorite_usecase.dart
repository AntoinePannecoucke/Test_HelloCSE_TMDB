import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/repository/film/abstr_film_repository.dart';
import 'package:test_technique_hellocse/model/film.dart';

@injectable
class ToggleFavoriteUseCase {
  Future<void> invoke(bool toggle, Film film) async {
    return toggle ?
    getItLocator<AbstrFilmRepository>().insertFavoriteFilm(film) :
    getItLocator<AbstrFilmRepository>().removeFavoriteFilm("${film.id}");
  }
}