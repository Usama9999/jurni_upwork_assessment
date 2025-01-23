import 'dart:ui';

import 'package:UpworkAssessment/globals/bindings.dart';
import 'package:UpworkAssessment/globals/easy_loading.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/screens/landing_page.dart';
import 'package:UpworkAssessment/utils/app_theme.dart';
import 'package:UpworkAssessment/utils/connection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    EasyLoading.dismiss();
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    Future.delayed(Duration.zero, () {
      EasyLoading.dismiss();
    });
    return true;
  };

  // var c = Get.put(OnbaordingController());
  EasyLoading.dismiss();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(OverlaySupport(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, _) {
          return GetMaterialApp(
            color: Colors.white,
            title: 'Upwork Assessment',
            themeMode: ThemeMode.light,
            fallbackLocale: const Locale('en', 'US'),
            locale: const Locale('en', 'US'),
            defaultTransition: Transition.cupertino,
            debugShowCheckedModeBanner: false,
            initialBinding: InitialBinding(),
            theme: AppTheme.data(),
            home: LandingPage(),
          );
        });
  }
}
