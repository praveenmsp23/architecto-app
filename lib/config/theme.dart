import 'package:flutter/cupertino.dart';

extension CupertinoThemeDataExtension on CupertinoThemeData {
  Color get secondaryColor => this.brightness == Brightness.dark
      ? CupertinoColors.systemGrey
      : CupertinoColors.systemGrey2;

  Color get primaryTextColor => this.brightness == Brightness.dark
      ? CupertinoColors.white
      : CupertinoColors.black;

  Color get secondaryTextColor => this.brightness == Brightness.dark
      ? CupertinoColors.systemGrey2
      : CupertinoColors.systemGrey;

  Color get primaryButtonTextColor => this.brightness == Brightness.dark
      ? CupertinoColors.black
      : CupertinoColors.white;
}

class Themes {
  final CupertinoThemeData lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.black,
    primaryContrastingColor: CupertinoColors.systemRed,
    scaffoldBackgroundColor: CupertinoColors.white,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: "Sriracha",
        fontWeight: FontWeight.w400,
      ),
      primaryColor: CupertinoColors.black,
    ),
  );

  final CupertinoThemeData darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.white,
    primaryContrastingColor: CupertinoColors.systemRed,
    scaffoldBackgroundColor: CupertinoColors.black,
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: "Sriracha",
        fontWeight: FontWeight.w400,
      ),
      primaryColor: CupertinoColors.white,
    ),
  );
}
