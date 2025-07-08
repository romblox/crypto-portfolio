import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 60, 59, 59),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 249, 241, 9),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 60, 59, 59),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 22,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withValues(alpha: 0.6),
      fontSize: 18,
    ),
    headlineMedium: TextStyle(color: Colors.white, fontSize: 28),
  ),
  dividerTheme: DividerThemeData(color: Colors.white10),
  listTileTheme: ListTileThemeData(iconColor: Colors.white),
);
