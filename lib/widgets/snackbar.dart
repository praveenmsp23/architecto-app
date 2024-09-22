import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBar {
  void infoMessage(String message, [String? details]) {
    Get.snackbar(
      message,
      details ?? "Something went wrong. Please try again later.",
      icon: Icon(CupertinoIcons.info_circle),
      backgroundColor: Colors.lightBlue,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      borderRadius: 10,
      barBlur: 40,
      padding: EdgeInsets.all(8),
      duration: Duration(seconds: 5),
    );
  }

  void successMessage(String message, [String? details]) {
    Get.snackbar(
      message,
      details ?? "Something went wrong. Please try again later.",
      icon: Icon(CupertinoIcons.checkmark_circle),
      backgroundColor: Colors.lightGreen,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 10,
      barBlur: 40,
      padding: EdgeInsets.all(8),
      duration: Duration(seconds: 5),
    );
  }

  void errorMessage(String message, [String? details]) {
    Get.snackbar(
      message,
      details ?? "Something went wrong. Please try again later.",
      icon: Icon(CupertinoIcons.exclamationmark_circle),
      backgroundColor: Colors.red,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 10,
      barBlur: 40,
      padding: EdgeInsets.all(8),
      duration: Duration(seconds: 5),
    );
  }

  void warningMessage(String message, [String? details]) {
    Get.snackbar(
      message,
      details ?? "Something went wrong. Please try again later.",
      icon: Icon(CupertinoIcons.exclamationmark_triangle),
      backgroundColor: Colors.orange,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 10,
      barBlur: 40,
      padding: EdgeInsets.all(8),
      duration: Duration(seconds: 5),
    );
  }
}
