import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/repository/film/abstr_film_repository.dart';

@injectable
class IsFavoriteUseCase {
  static Future<bool> invoke(String idFilm) async {
    return await getItLocator<AbstrFilmRepository>().isFavorite(idFilm);
  }
}