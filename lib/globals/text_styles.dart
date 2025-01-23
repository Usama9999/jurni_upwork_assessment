import 'package:UpworkAssessment/globals/imports.dart';

class AppTextStyles {
  static AppTextStyles instance = AppTextStyles._();
  AppTextStyles._();
  TextStyle headingText({double size = 16, Color? color}) {
    return TextStyle(
        color: color ?? AppColors.instance.defaultTextColor,
        fontWeight: FontWeight.w800,
        fontSize: (size));
  }

  TextStyle subHeadingText({double size = 16, Color? color}) {
    return TextStyle(
        color: color ?? AppColors.instance.defaultTextColor,
        fontSize: (size),
        fontWeight: FontWeight.bold);
  }

  TextStyle regular({double size = 16, Color? color}) {
    return TextStyle(
      color: color ?? AppColors.instance.defaultTextColor,
      fontSize: (size),
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle normalText({double size = 16, Color? color}) {
    return TextStyle(
      color: color ?? AppColors.instance.defaultTextColor,
      fontSize: (size),
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle lightText({double size = 16, Color? color}) {
    return TextStyle(
      // fontFamily: "Roboto",
      color: AppColors.instance.defaultTextColor,
      fontSize: (size),
      fontWeight: FontWeight.w400,
    );
  }
}
