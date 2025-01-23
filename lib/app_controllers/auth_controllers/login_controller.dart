import 'package:UpworkAssessment/globals/easy_loading.dart';
import 'package:UpworkAssessment/globals/enum.dart';
import 'package:UpworkAssessment/globals/global_functions.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/globals/ui_candies_functions.dart';
import 'package:UpworkAssessment/modules/home/screens/home_page.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onboarding_cont_repo.ex.dart';
import 'package:UpworkAssessment/services/database_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  loginWithGoogle() async {
    try {
      EasyLoading.show();
      var googleSign = GoogleSignIn(scopes: ["email"]);
      final user = await googleSign.signIn();
      final googleAuth = await user?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (!(await DatabaseHelper.isExist(value.user!.uid))) {
          if (value.user != null) {
            Get.find<OnbaordingController>().saveOnbaordingResponse();
            Get.to(() => HomePage());
            EasyLoading.dismiss();
          }
        } else {
          EasyLoading.dismiss();
          UICandiesFunction.showToastAlert(
              strMsg: GlobalFunctions.instance
                  .handleErrorMsg('This account already exists'),
              toastType: TOAST_TYPE.toastError);
        }
      });
    } catch (e) {
      UICandiesFunction.showToastAlert(
          strMsg: GlobalFunctions.instance.handleErrorMsg(e),
          toastType: TOAST_TYPE.toastError);
      EasyLoading.dismiss();
    }
  }

  loginWithApple() async {
    try {
      EasyLoading.show();
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = OAuthProvider('apple.com');
      final cred = oAuthProvider.credential(
          idToken: credential.identityToken,
          accessToken: credential.authorizationCode);
      await FirebaseAuth.instance
          .signInWithCredential(cred)
          .then((value) async {
        if (!(await DatabaseHelper.isExist(value.user!.uid))) {
          if (value.user != null) {
            Get.find<OnbaordingController>().saveOnbaordingResponse();
            EasyLoading.dismiss();
            Get.to(() => HomePage());
          }
        } else {
          EasyLoading.dismiss();
          UICandiesFunction.showToastAlert(
              strMsg: GlobalFunctions.instance
                  .handleErrorMsg('This account already exists'),
              toastType: TOAST_TYPE.toastError);
        }
      });
    } catch (e) {
      UICandiesFunction.showToastAlert(
          strMsg: GlobalFunctions.instance.handleErrorMsg(e),
          toastType: TOAST_TYPE.toastError);
      EasyLoading.dismiss();
    }
  }
}
