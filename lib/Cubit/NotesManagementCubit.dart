import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/State classes/NoteDatabase.dart';
import 'package:notes_cubit/model/NoteModel.dart';

class NotesManagementCubit extends Cubit<CollectionOfNotes> {
  //initial state
  NotesManagementCubit() : super(CollectionOfNotes(array: []));

  //Method to add data
  void addData({required Note data}) {
    List<Note> currentList = state.array;
    currentList.add(data);
    emit(CollectionOfNotes(array: currentList));
  }

  void deleteNote({required int index}) {
    List<Note> currentList = state.array;
    currentList.removeAt(index);
    emit(CollectionOfNotes(array: currentList));
  }

  void updateNote(
      {required int index, required String name, required String description}) {
    List<Note> currentList = state.array;
    currentList[index] = Note(name: name, description: description);
    emit(CollectionOfNotes(array: currentList));
  }
}
