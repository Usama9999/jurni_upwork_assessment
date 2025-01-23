import 'package:UpworkAssessment/globals/app_colors.dart';
import 'package:flutter/material.dart';

// All rights reserved by Healer

class AppTheme {
  static ThemeData data() => ThemeData(
        // androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
        primaryColor: AppColors.instance.primaryColor,
        popupMenuTheme: _popUpMenuThemeData(),
        appBarTheme: AppBarTheme(surfaceTintColor: Colors.transparent),
        scaffoldBackgroundColor: AppColors.instance.scaffold,

        splashColor: Colors.grey.shade400,
        highlightColor: Colors.blueGrey[200]?.withOpacity(.25),

        canvasColor:
            Colors.transparent, //This is necessary for bottomSheet to work.
      );

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
      );
}
