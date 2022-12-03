import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_technique_hellocse/core/get_it/get_it.dart';
import 'package:test_technique_hellocse/core/manager/database_manager.dart';

import 'app.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  setupGetIt();
  getItLocator<DatabaseManager>().init();
  runApp(const App());
}



