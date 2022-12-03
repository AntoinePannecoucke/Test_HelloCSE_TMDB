import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/view/favorites_list/favorites_list.dart';
import 'package:test_technique_hellocse/view/films_list/films_list.dart';
import 'package:test_technique_hellocse/view/main/main_page_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final MainPageViewModel viewModel = getItLocator<MainPageViewModel>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

        bottomNavigationBar: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(
              label: "Films",
              icon: Icon(Icons.movie_outlined),
              activeIcon: Icon(Icons.movie, color: Colors.blue)
            ),
            BottomNavigationBarItem(
              label: "Favorites",
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite, color: Colors.blue)
            ),
          ],
          currentIndex: viewModel.currentPageIndex,
          onTap: (newIndex) {
            viewModel.goToPage(newIndex);
            setState(() {

            });
          },
        ),
      body: PageView(
        controller: viewModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          FilmsList(viewModel: viewModel, refresh: () {
            setState(() {

            });
          }),
          FavoritesList(viewModel: viewModel, refresh: () {
            setState(() {

            });
          })
        ],
      ),
    );
  }
}