import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts
        .architectsDaughter()
        .fontFamily,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 38,
        color: Colors.black,
        fontFamily: GoogleFonts
            .architectsDaughter()
            .fontFamily,
      ),
    ),
  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: GoogleFonts
        .caveat()
        .fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 5,
      centerTitle: false,
      titleTextStyle: TextStyle(
          fontSize: 38,
          fontFamily: GoogleFonts
              .neucha()
              .fontFamily,
          letterSpacing: 4),
    ),
  );
}
