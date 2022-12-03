import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/core/manager/database_manager.dart';
import 'package:test_technique_hellocse/model/film.dart';

@singleton
class SembastSourceFilm {

  DatabaseManager databaseManager =  getItLocator<DatabaseManager>();

  Future<void> insertFavoriteFilm(Film film) async =>
      await databaseManager.db.transaction((transaction) async =>
      await databaseManager.favoritesStore.record(film.id).put(transaction, film.toJson()));

  Future<void> removeFavoriteFilm(String idFilm) async =>
      await databaseManager.favoritesStore.record(idFilm).delete(databaseManager.db);

  Future<bool> isFavorite(String idFilm) async =>
      await databaseManager.favoritesStore.record(idFilm).exists(databaseManager.db);

  Future<List<RecordSnapshot<String, Map<String, dynamic>>>> getFavoriteFilms() async =>
      await databaseManager.favoritesStore.find(databaseManager.db);
}