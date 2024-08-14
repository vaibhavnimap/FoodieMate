/*
 *
 * Created by Deepak Gupta on 10/10/23, 4:20 pm
 * Copyright (c) 2023 . All rights reserved.
 * Last modified 23/1/23, 2:27 pm
 *
 *
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quiz2fun/presentation/themes/app_theme.dart' as c;

class CustomSnackBar {
  CustomSnackBar._();

  static success(
    String message, {
    String titleText = 'Success',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      titleText,
      message,
      maxWidth: 600,
      messageText: Text(
        message,
        // style: c.textStyle(
        //   color: c.white,
        //   weight: FontWeight.w600,
        // ),
      ),
      titleText: Text(
        titleText,
        // style: c.textStyle(
        //   color: c.white,
        //   weight: FontWeight.bold,
        //   fontSize: 18,
        // ),
      ),
      duration: duration,
      // backgroundColor: c.success,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
    );
  }

  static error(
    String message, {
    duration = const Duration(seconds: 3),
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      "Error!",
      message,
      maxWidth: 600,
      messageText: Text(
        message,
        // style: c.textStyle(
        //   color: c.white,
        //   weight: FontWeight.w600,
        // ),
      ),
      titleText: Text(
        "Error!",
        // style: c.textStyle(
        //   color: c.white,
        //   weight: FontWeight.bold,
        //   fontSize: 18,
        // ),
      ),
      duration: duration,
      // backgroundColor: c.error,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
    );
  }

  static tryAgain() {
    error("Something went wrong! Please try again!");
  }

  static pleaseCheckYourInternetConnection() {
    error('No internet. Check connection and retry');
  }
}
