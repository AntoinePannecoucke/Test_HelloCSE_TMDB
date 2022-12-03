import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/components/list_item/film_list_item.dart';
import 'package:test_technique_hellocse/model/film.dart';
import 'package:test_technique_hellocse/view/main/main_page_viewmodel.dart';

class FilmsList extends StatefulWidget {

  final MainPageViewModel viewModel;

  const FilmsList({
    super.key,
    required this.viewModel
  });

  @override
  State<StatefulWidget> createState() => _FilmsListState();

}

class _FilmsListState extends State<FilmsList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Film>>(
      future: widget.viewModel.getFilms(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FilmListItem(film: snapshot.data![index])
                );
              });
        }
        return const Center(child: Text("Aucun film"));
      }
    );
  }

}