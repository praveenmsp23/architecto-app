import 'package:flutter/cupertino.dart';

const CupertinoThemeData lightThemeData = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor:
      CupertinoColors.black, // Primary color for components like buttons
  primaryContrastingColor:
      CupertinoColors.systemGrey, // Secondary color for elements like links
  barBackgroundColor:
      CupertinoColors.white, // Background color for navigation bars
  scaffoldBackgroundColor:
      CupertinoColors.white, // Background color for the scaffold
  textTheme: CupertinoTextThemeData(
    primaryColor: CupertinoColors.black, // Default color for text
    navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20), // Style for navigation bar titles
    navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.black, fontSize: 34), // Style for large titles
    actionTextStyle: TextStyle(
        color: CupertinoColors.activeBlue), // Style for action buttons
    tabLabelTextStyle:
        TextStyle(color: CupertinoColors.systemGrey), // Style for tab labels
    pickerTextStyle:
        TextStyle(color: CupertinoColors.black), // Style for picker text
    dateTimePickerTextStyle:
        TextStyle(color: CupertinoColors.black), // Style for date picker text
  ),
);

const CupertinoThemeData darkThemeData = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: CupertinoColors.white, // Inverse primary color for dark mode
  primaryContrastingColor:
      CupertinoColors.systemGrey, // Secondary color remains the same
  barBackgroundColor: CupertinoColors
      .black, // Background color for navigation bars in dark mode
  scaffoldBackgroundColor:
      CupertinoColors.black, // Background color for the scaffold in dark mode
  textTheme: CupertinoTextThemeData(
    primaryColor: CupertinoColors.white, // Default color for text in dark mode
    navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20), // Style for navigation bar titles
    navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white, fontSize: 34), // Style for large titles
    actionTextStyle: TextStyle(
        color: CupertinoColors
            .activeOrange), // Style for action buttons in dark mode
    tabLabelTextStyle: TextStyle(
        color:
            CupertinoColors.systemGrey2), // Style for tab labels in dark mode
    pickerTextStyle: TextStyle(
        color: CupertinoColors.white), // Style for picker text in dark mode
    dateTimePickerTextStyle: TextStyle(
        color:
            CupertinoColors.white), // Style for date picker text in dark mode
  ),
);
