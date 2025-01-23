import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalFunctions {
  GlobalFunctions._();

  static GlobalFunctions instance = GlobalFunctions._();
  hiddenKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  handleErrorMsg(e) {
    String? error = 'Something went wrong! Please try again';
    if (e is PlatformException) {
      if (e.code == "network_error") {
        error = 'Please check your internet connection and try again';
      } else {
        if (kDebugMode) {
          return error.toString();
        }
        error = e.message;
      }
    }
    if (kDebugMode) {
      return error.toString();
    }
    return error;
  }
}
