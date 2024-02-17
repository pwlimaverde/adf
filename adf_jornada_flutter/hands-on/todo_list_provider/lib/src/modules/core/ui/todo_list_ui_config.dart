import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.mandaliTextTheme(),
        // primaryColor: const Color(0xff5C77CE),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff5C77CE),
          background: Colors.white
        ),
        primaryColorLight: const Color(0xffABC8F7),
      );
}
