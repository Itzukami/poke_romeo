import 'package:flutter/material.dart';

class TemaApp {
  ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 149, 65, 65)),
    /* brightness: Brightness.dark, */
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
  );

  ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    /*    brightness: Brightness.light, */
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ),
  );
}
