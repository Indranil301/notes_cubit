import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/Cubit/NotesManagementCubit.dart';
import 'package:notes_cubit/model/NoteModel.dart';

class UpdateNoteDialogBox extends StatelessWidget {
  int index;
  UpdateNoteDialogBox({super.key, required this.index});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    nameController.text =
        BlocProvider.of<NotesManagementCubit>(context).state.array[index].name;
    descriptionController.text = BlocProvider.of<NotesManagementCubit>(context)
        .state
        .array[index]
        .description;
    return AlertDialog(
      title: const Text('Create a note'),
      content: SizedBox(
        width: size.width * 0.80,
        height: size.height * 0.30,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Canel'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<NotesManagementCubit>(context).updateNote(
                index: index,
                name: nameController.text.toString(),
                description: descriptionController.text.toString());

            Navigator.pop(context, 'Update');
          },
          child: const Text('Update'),
        )
      ],
    );
  }
}
