//Singleton class for app database

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes_cubit/model/NoteModel.dart';
import 'package:path_provider/path_provider.dart';

String boxName = 'notes';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase db = AppDatabase._();
  late Box notes;

  //initialize database
  Future<bool> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(NoteAdapter());
    notes = await Hive.openBox<Note>(boxName);

    return true;
  }

  //Method to fetch all notes
  Future<List<Note>> fetchAllNotes() async {
    int numberOfNotes = await notes.length;
    List<Note> currentList = [];
    for (int i = 0; i < numberOfNotes; i++) {
      currentList.add(await notes.getAt(i));
    }

    return currentList;
  }

  //Add a note to database
  Future<bool> addNote({required Note data}) async {
    await notes.add(data);

    return true;
  }

  //Delete a note fromm database
  Future<bool> deleteNote({required int index}) async {
    await notes.deleteAt(index);

    return true;
  }

  //Update a note from database
  Future<bool> updateNote(
      {required int index,
      required String name,
      required String description}) async {
    await notes.putAt(index, Note(name: name, description: description));

    return true;
  }
}
