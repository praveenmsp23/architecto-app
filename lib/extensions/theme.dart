import 'package:flutter/cupertino.dart';

extension CupertinoThemeValues on BuildContext {
  Color get primaryColor => CupertinoTheme.of(this).primaryColor;
  Color get secondaryColor => CupertinoTheme.of(this).primaryContrastingColor;
  Color get scaffoldBackgroundColor =>
      CupertinoTheme.of(this).scaffoldBackgroundColor;
  Color get barBackgroundColor => CupertinoTheme.of(this).barBackgroundColor;

  TextStyle get navTitleTextStyle =>
      CupertinoTheme.of(this).textTheme.navTitleTextStyle;
  TextStyle get navLargeTitleTextStyle =>
      CupertinoTheme.of(this).textTheme.navLargeTitleTextStyle;
  TextStyle get pickerTextStyle =>
      CupertinoTheme.of(this).textTheme.pickerTextStyle;
  TextStyle get dateTimePickerTextStyle =>
      CupertinoTheme.of(this).textTheme.dateTimePickerTextStyle;
  TextStyle get tabLabelTextStyle =>
      CupertinoTheme.of(this).textTheme.tabLabelTextStyle;
  TextStyle get actionTextStyle =>
      CupertinoTheme.of(this).textTheme.actionTextStyle;

  CupertinoTextThemeData get textTheme => CupertinoTheme.of(this).textTheme;
}
