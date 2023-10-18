import 'package:expenses_app/expenses_list/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.green);
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Expenses(),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      textTheme: GoogleFonts.nunitoTextTheme(),
    ),
  ));
}
