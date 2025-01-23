import 'dart:io';

import 'package:flutter/material.dart';
import 'package:UpworkAssessment/globals/enum.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app_colors.dart';
import 'text_styles.dart';

//Main Global class
class UICandiesFunction {
  static showToastAlert(
      {required String strMsg,
      int duration = 2,
      TOAST_TYPE toastType = TOAST_TYPE.toastInfo}) {
    Widget widgetM = Container();
    Color borderColor = Colors.green;
    switch (toastType) {
      case TOAST_TYPE.toastInfo:
        borderColor = AppColors.instance.info;

        break;

      case TOAST_TYPE.toastSuccess:
        borderColor = AppColors.instance.success;

        break;

      case TOAST_TYPE.toastWarning:
        borderColor = AppColors.instance.warning;

        break;

      case TOAST_TYPE.toastError:
        borderColor = AppColors.instance.error;

        break;
    }

    widgetM = Container(
      margin: const EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
            color: borderColor),
        child: Text(
          strMsg,
          textAlign: TextAlign.start,
          style: AppTextStyles.instance
              .subHeadingText(size: 18, color: Colors.white),
        ),
      ),
    );

    showSimpleNotification(widgetM,
        background: Colors.transparent,
        duration: Duration(seconds: duration),
        slideDismissDirection: DismissDirection.up);
  }
}
