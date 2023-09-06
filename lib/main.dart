import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/Cubit/NotesManagementCubit.dart';
import 'package:notes_cubit/Cubit/Theme%20Manager%20Cubit.dart';
import 'package:notes_cubit/Database/App%20Database.dart';
import 'package:notes_cubit/screens/Homepage.dart';
import 'package:notes_cubit/utils/Themes.dart';

void main() {
  //Inject Bloc dependency

  runApp(MultiBlocProvider(providers: [
    //Cubit class for theme Manager
    BlocProvider<ThemeManagerCubit>(
      create: (context) => ThemeManagerCubit(),
    ),
    //Cubit class for Notes Management
    BlocProvider<NotesManagementCubit>(
      create: (context) => NotesManagementCubit(myDB: AppDatabase.db),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeManagerCubit, ThemeMode>(
      builder: (context, state) => MaterialApp(
        title: 'Notes_cubit',
        themeMode: BlocProvider.of<ThemeManagerCubit>(context).state,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        home: Homepage(),
      ),
    );
  }
}
