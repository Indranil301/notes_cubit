import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/Cubit/NotesManagementCubit.dart';
import 'package:notes_cubit/Cubit/Theme%20Manager%20Cubit.dart';
import 'package:notes_cubit/Database/NoteDatabase.dart';
import 'package:notes_cubit/utils/Create%20Note%20Dialog.dart';
import 'package:notes_cubit/utils/Update%20Note%20Dialog.dart';
import 'package:notes_cubit/utils/textstyle.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late bool isDark;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDark = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes'), actions: [
        Switch(
            value: isDark,
            onChanged: (bool value) {
              setState(() {
                isDark = value;
              });
              debugPrint(isDark.toString());
              BlocProvider.of<ThemeManagerCubit>(context)
                  .changeTheme(Dark: isDark);
            })
      ]),
      body: BlocBuilder<NotesManagementCubit, CollectionOfNotes>(
          builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(12, 30, 12, 12),
          itemCount:
              BlocProvider.of<NotesManagementCubit>(context).state.array.length,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    //Create edit button for every note
                    IconButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                UpdateNoteDialogBox(
                                  index: index,
                                )),
                        icon: const Icon(Icons.edit)),
                    //Create delete button for every note
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<NotesManagementCubit>(context)
                              .deleteNote(index: index);
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
              title: Text(
                BlocProvider.of<NotesManagementCubit>(context)
                    .state
                    .array[index]
                    .name,
                style: nameStyle,
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context, builder: (BuildContext context) => DialogBox()),
          child: const Icon(Icons.add)),
    );
  }
}
