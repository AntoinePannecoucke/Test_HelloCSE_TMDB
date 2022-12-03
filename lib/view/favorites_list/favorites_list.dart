import 'package:flutter/material.dart';
import 'package:test_technique_hellocse/view/main/main_page_viewmodel.dart';

class FavoritesList extends StatefulWidget {

  final MainPageViewModel viewModel;

  const FavoritesList({
    super.key,
    required this.viewModel
  });

  @override
  State<StatefulWidget> createState() => _FavoritesListState();

}

class _FavoritesListState extends State<FavoritesList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}