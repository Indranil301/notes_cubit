import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_cubit/Cubit/NotesManagementCubit.dart';
import 'package:notes_cubit/screens/Homepage.dart';

void main() {
  //Inject Bloc dependency

  runApp(BlocProvider(
    create: (context) => NotesManagementCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes_cubit',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.architectsDaughter().fontFamily,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 38,
            color: Colors.black,
            fontFamily: GoogleFonts.architectsDaughter().fontFamily,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: GoogleFonts.caveat().fontFamily,
        appBarTheme: AppBarTheme(
          elevation: 5,
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 38,
              fontFamily: GoogleFonts.neucha().fontFamily,
              letterSpacing: 4),
        ),
      ),
      home: const Homepage(),
    );
  }
}
