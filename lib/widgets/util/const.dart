import 'package:flutter/cupertino.dart';

abstract class AppFontStyle {
  static const double size12 = 12;
  static const double size14 = 14;
  static const double size16 = 16;
  static const double size18 = 18;

  static const String boldText = 'Roboto-Bold';
  static const String lightText = 'Roboto-Light';

  static const TextStyle boldTextStyle = TextStyle(
    fontFamily: boldText,
    color: AppColors.black,
  );
  static const TextStyle lightTextStyle = TextStyle(
    fontFamily: lightText,
    color: AppColors.gray,
  );
}

abstract class AppColors {
  static const Color blue = Color(0xFFF5F8FE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1E1F4B);
  static const Color gray = Color(0xFF787A8D);
  static const Color backgroundLightGray = Color(0xFFF9F9FB);
}
