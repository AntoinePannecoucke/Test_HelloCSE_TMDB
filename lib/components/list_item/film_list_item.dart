import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/core/mixin/favorite_toggle_mixin.dart';
import 'package:test_technique_hellocse/model/film.dart';
import 'package:test_technique_hellocse/view/favorites_list/favorites_list.dart';

class FilmListItem extends StatefulWidget {

  final FavoriteToggle favoriteToggle;
  final Film film;

  final Function() refresh;

  const FilmListItem({
    super.key,
    required this.film,
    required this.favoriteToggle,
    required this.refresh
  });

  @override
  State<StatefulWidget> createState() => _FilmListItemState();

}

class _FilmListItemState extends State<FilmListItem> {

  bool isToggle = false;



  Future loadToggle() async {
    isToggle = await widget.favoriteToggle.isFavorite(widget.film);
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    loadToggle();

    return Card(
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.network("https://image.tmdb.org/t/p/w500${widget.film.poster}"),
            ),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: ListTile(
                                title: Text(widget.film.title, maxLines: 2),
                                subtitle: Text(widget.film.release),
                              )
                          ),
                          Expanded(
                              child: IconButton(
                                onPressed: () async {
                                  await widget.favoriteToggle.toggle(widget.film);
                                  isToggle = !isToggle;
                                  widget.refresh();
                                }
                                , icon: isToggle ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_rounded),
                                color: Colors.red,
                              )
                          )
                        ],
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(widget.film.overview, maxLines: 3, overflow: TextOverflow.ellipsis)
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}