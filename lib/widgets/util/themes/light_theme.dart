import 'package:easy_converter/widgets/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  //For light theme
  static const Color _gray1 = Color(0xFF08081F);
  static const Color _gray2 = Color(0xFF6E6E86);
  static const Color _gray3 = Color(0xFFF5F8FE);
  static const Color _gray4 = Color(0xFFF9F9FC);
  static const Color _gray5 = Color(0xFFFFFFFF);
  static const Color _gray6 = Color(0xFFF3F4F9);
  static const Color _gray7 = Color(0xFFB6B7E2);
  static const Color _blue1 = Color(0xFF445EDC);
  static const Color _red1 = Color(0xFFE03655);
  static const Color _bgWhite = Color(0x611D1C26);

//For dark theme
  static const Color _dark1 = Color(0xFFFFFFFF);
  static const Color _dark2 = Color(0xFF737499);
  static const Color _dark3 = Color(0xFF0E141F);
  static const Color _dark4 = Color(0xFF252837);
  static const Color _dark5 = Color(0xFF1E2330);
  static const Color _dark6 = Color(0xFF253045);
  static const Color _dark7 = Color(0xFF4A4B67);
  static const Color _darkBlue1 = Color(0xFF516DF1);
  static const Color _darkRed1 = Color(0xFFFF395D);
  static const Color _bgDark = Color(0x61030010);

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: _gray3,
      backgroundColor: _gray5,
      primaryColor: _blue1,
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _gray4,
        suffixStyle: TextStyle(
          fontSize: 16,
          color: _gray7,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _blue1, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            )),
        contentPadding: const EdgeInsets.all(8),
          prefixIconColor: _gray2 ,
        hintStyle: TextStyle(fontSize: 16),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: _gray5,
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: _gray1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(
            color: _blue1,
          ),
          actionsIconTheme: IconThemeData(
            size: 24,
            color: _gray2,
          )),
      textTheme: TextTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _blue1,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      backgroundColor: _dark3,
      primaryColor: _darkBlue1,
      textTheme: TextTheme(),
    );
  }
}
