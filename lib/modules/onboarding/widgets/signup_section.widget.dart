import 'dart:io';

import 'package:UpworkAssessment/extensions/sized_box.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/globals/widgets/app_button.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';

class SignupWidget extends GetView<OnbaordingController> {
  const SignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      20.hp,
      Text(
        'Create an account',
        style: AppTextStyles.instance.headingText(size: 25),
      ),
      Spacer(),
      if (Platform.isIOS)
        AppButton(
          title: 'Sign up with Apple',
          onTap: () {
            controller.authController.loginWithApple();
          },
          borderRadius: 100,
          elevation: 0,
        ),
      30.hp,
      AppButton(
        borderSide: BorderSide(color: AppColors.instance.primaryColor),
        title: 'Sign up with Google',
        onTap: () {
          controller.authController.loginWithGoogle();
        },
        color: Colors.white,
        fontColor: AppColors.instance.primaryColor,
        elevation: 0,
        borderRadius: 100,
      ),
      Spacer()
    ]);
  }
}
