import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/model/film.dart';

class FilmListItem extends StatelessWidget {

  final Film film;

  const FilmListItem({
    super.key,
    required this.film
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.network("https://image.tmdb.org/t/p/w500${film.poster}"),
            ),
            Expanded(
              flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: ListTile(
                                    title: Text(film.title, maxLines: 2),
                                    subtitle: Text(film.release),
                                  )
                              ),
                              Expanded(
                                  child: IconButton(onPressed: () => {}, icon: const Icon(Icons.favorite_border_rounded),)
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 5,
                          child: Text(film.overview, maxLines: 3, overflow: TextOverflow.ellipsis)
                        )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}