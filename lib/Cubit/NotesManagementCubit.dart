import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/Database/App%20Database.dart';
import 'package:notes_cubit/State classes/NoteDatabase.dart';
import 'package:notes_cubit/model/NoteModel.dart';

class NotesManagementCubit extends Cubit<CollectionOfNotes> {
  //initial state
  AppDatabase myDB;

  NotesManagementCubit({required this.myDB})
      : super(CollectionOfNotes(array: []));

  void initializeAllNotes() async {
    bool check = await myDB.initDatabase();
    if (check == true) {
      var currentList = await myDB.fetchAllNotes();
      emit(CollectionOfNotes(array: currentList));
    }
  }

  //Method to add data
  void addData({required Note data}) async {
    bool check = await myDB.addNote(data: data);
    if (check == true) {
      var currentList = await myDB.fetchAllNotes();
      emit(CollectionOfNotes(array: currentList));
    }
  }

  void deleteNote({required int index}) async {
    bool check = await myDB.deleteNote(index: index);
    if (check == true) {
      var currentList = await myDB.fetchAllNotes();
      emit(CollectionOfNotes(array: currentList));
    }
  }

  void updateNote(
      {required int index,
      required String name,
      required String description}) async {
    bool check = await myDB.updateNote(
        index: index, name: name, description: description);
    if (check == true) {
      var currentList = await myDB.fetchAllNotes();
      emit(CollectionOfNotes(array: currentList));
    }
  }
}
