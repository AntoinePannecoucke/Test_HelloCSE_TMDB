import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/domain/usecase/film/get_now_playing_usecase.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Injectable()
class MainPageViewModel {
  PageController pageController = PageController();
  int currentPageIndex = 0;

  void goToPage(int newIndex) {
    currentPageIndex = newIndex;
    pageController.animateToPage(newIndex, duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  Future<List<Film>> getFilms() async => getItLocator<GetNowPlayingUseCase>().invoke();
}