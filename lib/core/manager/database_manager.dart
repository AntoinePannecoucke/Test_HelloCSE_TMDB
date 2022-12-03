import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:test_technique_hellocse/model/film.dart';

@Singleton(order: -4)
class DatabaseManager {
  static const _favoritesStore = "favorites-store";
  static DatabaseManager instance = DatabaseManager._internal();

  factory DatabaseManager() => instance;

  late Database db;

  final StoreRef<String, Map<String, dynamic>> favoritesStore = stringMapStoreFactory.store(_favoritesStore);

  DatabaseManager._internal();

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    db = await databaseFactoryIo
        .openDatabase("$dataDirectoryPath/flutter_hello_cse_test.db");
  }
}