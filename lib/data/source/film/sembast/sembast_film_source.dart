import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/core/manager/database_manager.dart';
import 'package:test_technique_hellocse/model/film.dart';

@singleton
class SembastFilmSource {

  final DatabaseManager _databaseManager =  getItLocator<DatabaseManager>();

  Future<void> insertFavoriteFilm(Film film) async =>
      await _databaseManager.db.transaction((transaction) async =>
      await _databaseManager.favoritesStore.record(film.id).put(transaction, film.toJson()));

  Future<void> removeFavoriteFilm(String idFilm) async =>
      await _databaseManager.favoritesStore.record(idFilm).delete(_databaseManager.db);

  Future<bool> isFavorite(String idFilm) async =>
      await _databaseManager.favoritesStore.record(idFilm).exists(_databaseManager.db);

  Future<List<RecordSnapshot<String, Map<String, dynamic>>>> getFavoriteFilms() async =>
      await _databaseManager.favoritesStore.find(_databaseManager.db);
}