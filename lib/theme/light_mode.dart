import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: const Color.fromARGB(255, 237, 236, 236),
      primary: Colors.grey.shade500,
      secondary: const Color.fromARGB(255, 130, 130, 130),
      inversePrimary: const Color.fromARGB(255, 48, 47, 47),
    ));
