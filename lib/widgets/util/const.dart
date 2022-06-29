import 'package:flutter/cupertino.dart';

abstract class AppFontStyle {
  static const double size12 = 12;
  static const double size14 = 14;
  static const double size16 = 16;
  static const double size18 = 18;

  static const String regularText = 'Roboto-Regular';
  static const String boldText = 'Roboto-Bold';
  static const String lightText = 'Roboto-Light';

  static const TextStyle regularTextStyle = TextStyle(
    color: AppColors.gray1,
  );
  static const TextStyle boldTextStyle = TextStyle(
    fontFamily: boldText,
    color: AppColors.gray1,
  );
  static const TextStyle lightTextStyle = TextStyle(
    fontFamily: lightText,
    color: AppColors.gray2,
  );
}

abstract class AppColors {

  static const Color gray1 = Color(0xFF08081F);
  static const Color gray2 = Color(0xFF6E6E86);
  static const Color gray3 = Color(0xFFF5F8FE);
  static const Color gray4 = Color(0xFFF9F9FC);
  static const Color gray5 = Color(0xFFFFFFFF);
  static const Color gray6 = Color(0xFFF3F4F9);
  static const Color gray7 = Color(0xFFB6B7E2);

  static const Color blue1 = Color(0xFF445EDC);

  static const Color red1 = Color(0xFFE03655);

  static const Color bgWhite = Color(0x611D1C26);








  // static const Color dark1 = Color(0xFFFFFFFF);
  // static const Color dark2 = Color(0xFF737499);
  // static const Color dark3 = Color(0xFF0E141F);
  // static const Color dark4 = Color(0xFF252837);
  // static const Color dark5 = Color(0xFF1E2330);
  // static const Color dark6 = Color(0xFF253045);
  // static const Color dark7 = Color(0xFF4A4B67);
  //
  //
  //
  //
  //
  //
  //
  //
  // static const Color blue = Color(0xFFF5F8FE);
  // static const Color white = Color(0xFFFFFFFF);
  // static const Color black = Color(0xFF1E1F4B);
  // static const Color gray = Color(0xFF787A8D);
  // static const Color backgroundTextFieldLightGray = Color(0xFFF9F9FB);
  // static const Color flutterActionButton = Color(0xFF445EDC);
}
