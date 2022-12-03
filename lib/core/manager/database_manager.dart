import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:test_technique_hellocse/model/film.dart';

@singleton
class DatabaseManager {
  static const favoritesStore = "favorites-store";
  static DatabaseManager instance = DatabaseManager._internal();

  factory DatabaseManager() => instance;

  late Database _db;

  final StoreRef<String, Map<String, dynamic>> _favoritesStore = stringMapStoreFactory.store(favoritesStore);

  DatabaseManager._internal();

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    _db = await databaseFactoryIo
        .openDatabase("$dataDirectoryPath/flutter_hello_cse_test.db");
  }

  Future<void> toggleFavorite(bool isFavorite, Film film) =>
      isFavorite ? removeFavoriteFilm(film.id) : insertFavoriteFilm(film);

  Future<void> insertFavoriteFilm(Film film) async =>
      await _db.transaction((transaction) async =>
      await _favoritesStore.record(film.id).put(transaction, film.toJson()));

  Future<void> removeFavoriteFilm(String idFilm) async =>
      await _favoritesStore.record(idFilm).delete(_db);

  Future<bool> isFavorite(String idFilm) async =>
      await _favoritesStore.record(idFilm).exists(_db);

  Future<List<Film>> getFavoriteLaunches() async =>
      await _favoritesStore.find(_db).then((records) =>
          records.map((record) => Film.fromJson(record.value)).toList());
}