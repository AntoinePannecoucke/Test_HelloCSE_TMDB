import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/components/list_item/film_list_item.dart';
import 'package:test_technique_hellocse/model/film.dart';
import 'package:test_technique_hellocse/view/main/main_page_viewmodel.dart';

class FavoritesList extends StatefulWidget {

  final MainPageViewModel viewModel;
  final Function() refresh;

  const FavoritesList({
    super.key,
    required this.viewModel,
    required this.refresh
  });

  @override
  State<StatefulWidget> createState() => _FavoritesListState();

}

class _FavoritesListState extends State<FavoritesList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Film>>(
        future: widget.viewModel.getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FilmListItem(film: snapshot.data![index], favoriteToggle: widget.viewModel, refresh: widget.refresh,)
                  );
                });
          }
          return const Center(child: CircularProgressIndicator(),);
        }
    );
  }

}