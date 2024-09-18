import 'package:architecto/config/theme.dart';
import 'package:flutter/cupertino.dart';

extension CupertinoThemeValues on BuildContext {
  Color get primaryColor => CupertinoTheme.of(this).primaryColor;
  Color get secondaryColor => CupertinoTheme.of(this).secondaryColor;

  Color get primaryTextColor => CupertinoTheme.of(this).primaryTextColor;
  Color get secondaryTextColor => CupertinoTheme.of(this).secondaryTextColor;
  Color get primaryButtonTextColor =>
      CupertinoTheme.of(this).primaryButtonTextColor;
}
