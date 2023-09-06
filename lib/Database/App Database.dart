//Singleton class for app database

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  AppDatabase._();

  AppDatabase db = AppDatabase._();
  late Box notes;

  //initialize database
  void initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }
}
