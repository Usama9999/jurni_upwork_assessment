import 'package:UpworkAssessment/globals/global_functions.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double height;
  final double? width;
  final double elevation;
  final double? borderRadius;
  final double fontSize;
  final Color? color;
  final BorderSide? borderSide;
  final Color fontColor;
  final Function onTap;
  final bool isLoading;
  final FontWeight? fontWeight;
  final Widget? icon;
  final bool isIconLeading;
  final bool? isDisabled;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
  final Color? disabledFontColor;
  const AppButton({
    Key? key,
    this.color,
    this.padding,
    this.fontColor = Colors.white,
    this.borderSide,
    this.height = 60,
    this.elevation = 1.5,
    this.fontWeight,
    this.isIconLeading = false,
    this.width,
    this.icon,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.isLoading = false,
    required this.title,
    required this.onTap,
    this.isDisabled,
    this.disabledColor,
    this.disabledFontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled ?? false,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          width: width?.toDouble().w ?? 1.sw,
          height: height.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor: isDisabled == true
                  ? disabledColor ?? AppColors.instance.disabledColor
                  : color ??
                      (isDisabled == true
                          ? disabledColor ?? AppColors.instance.disabledColor
                          : AppColors.instance.primaryColor),

              padding: padding ?? EdgeInsets.zero,
              elevation: elevation,
              backgroundColor: backGroundColor,
              shape: RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
                borderRadius: BorderRadius.circular(
                  borderRadius?.r ?? 12.r,
                ),
              ),
              minimumSize: Size(
                width?.toDouble().w ?? 1.sw,
                height.h,
              ),
              // width: width?.toDouble() ?? 1.sw,
              alignment: Alignment.center,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            onPressed: isDisabled == true
                ? () {}
                : () {
                    GlobalFunctions.instance.hiddenKeyboard();

                    onTap();
                  },
            child: Center(
              child: icon == null
                  ? AutoSizeText(
                      title.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.instance.headingText().copyWith(
                            color: textButtonColor,
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                          ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isIconLeading) icon!,
                        AutoSizeText(
                          title.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.instance.headingText().copyWith(
                                color: textButtonColor,
                                fontSize: fontSize,
                                fontWeight: fontWeight,
                              ),
                          // style: AppTextStyles.r16.copyWith(
                          //   color: Colors.white,
                          // ),
                        ),
                        if (!isIconLeading) icon!
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  bool get buttonDisabled {
    return color == AppColors.instance.disabledColor || isDisabled == true;
  }

  Color get textButtonColor {
    if (buttonDisabled) {
      return disabledFontColor ?? AppColors.instance.grey8B;
    } else {
      return fontColor;
    }
  }

  Color get backGroundColor {
    if (buttonDisabled) {
      return disabledColor ?? AppColors.instance.disabledColor;
    } else {
      return color ?? AppColors.instance.primaryColor;
    }
  }
}
