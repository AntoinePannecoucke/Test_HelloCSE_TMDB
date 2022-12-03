import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/core/mixin/favorite_toggle_mixin.dart';
import 'package:test_technique_hellocse/data/repository/film/film_repository.dart';
import 'package:test_technique_hellocse/domain/usecase/film/get_now_playing_usecase.dart';
import 'package:test_technique_hellocse/domain/usecase/film/is_favorite_usecase.dart';
import 'package:test_technique_hellocse/domain/usecase/film/toggle_favorite_usecase.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Injectable()
class MainPageViewModel implements FavoriteToggle {
  PageController pageController = PageController();
  int currentPageIndex = 0;

  void goToPage(int newIndex) {
    currentPageIndex = newIndex;
    pageController.animateToPage(newIndex, duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  Future<List<Film>> getFilms() async => getItLocator<GetNowPlayingUseCase>().invoke();

  @override
  Future toggle(Film selectedFilm) async {
    bool state = await isFavorite(selectedFilm);
    await getItLocator<ToggleFavoriteUseCase>().invoke(!state, selectedFilm);
  }

  @override
  Future<bool> isFavorite(Film film) async =>
      await getItLocator<IsFavoriteUseCase>().invoke("${film.id}");

}