import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/data/repository/film/abstr_film_repository.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Injectable()
class GetFavoritesUseCase {
  Future<List<Film>> invoke() async {
    return await getItLocator<AbstrFilmRepository>().getFavoriteFilms();
  }
}