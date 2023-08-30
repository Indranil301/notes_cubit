import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/Cubit/NotesManagementCubit.dart';
import 'package:notes_cubit/model/NoteModel.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            BlocProvider.of<NotesManagementCubit>(context).addData(
                data: Note(
                    name: nameController.text.toString(),
                    description: descriptionController.text.toString()));
            Navigator.pop(context, 'Save');
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}
