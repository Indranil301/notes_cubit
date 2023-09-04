import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeManagerCubit extends Cubit<ThemeMode> {
  //initial state of theme
  ThemeManagerCubit() : super(ThemeMode.light);

  void changeTheme({required Dark}) {
    if (Dark == true) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }
}
