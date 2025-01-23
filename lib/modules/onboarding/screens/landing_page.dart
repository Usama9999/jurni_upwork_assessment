import 'package:UpworkAssessment/extensions/sized_box.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/globals/widgets/app_button.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/screens/questionair_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var controller = Get.put(OnbaordingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.primaryColor,
      body: GetBuilder<OnbaordingController>(
          init: OnbaordingController(),
          id: 'landing',
          builder: (logic) {
            return Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SafeArea(
                      child: Image.asset(logic
                              .sliderItems[logic.currentSlideIndex]['image'])
                          .paddingAll(16)),
                  bottomBody(logic),
                ],
              ),
            );
          }),
    );
  }

  Positioned bottomBody(OnbaordingController logic) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16.w),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                pageview(logic),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.sliderItems.length, (i) {
                      return CircleAvatar(
                        backgroundColor: controller.currentSlideIndex == i
                            ? AppColors.instance.primaryColor
                            : AppColors.instance.disabledColor,
                        radius: 5,
                      ).paddingSymmetric(horizontal: 3);
                    })),
                20.hp,
                AppButton(
                  title: 'Next',
                  onTap: () {
                    Get.to(() => QuestionairPage());
                  },
                  elevation: 0,
                  borderRadius: 100,
                )
              ],
            ),
          ),
        ));
  }

  Container pageview(OnbaordingController logic) {
    return Container(
      height: 260.h,
      child: PageView.builder(
          onPageChanged: logic.changeCurrentSlide,
          itemCount: controller.sliderItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Column(
              children: [
                40.hp,
                Text(
                  controller.sliderItems[i]['heading'],
                  textAlign: TextAlign.center,
                  style: AppTextStyles.instance.headingText(size: 22),
                ),
                16.hp,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    controller.sliderItems[i]['body'],
                    textAlign: TextAlign.center,
                    style: AppTextStyles.instance.regular(size: 16),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
