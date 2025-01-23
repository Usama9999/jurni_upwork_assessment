import 'dart:io';

import 'package:UpworkAssessment/extensions/sized_box.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/globals/widgets/app_button.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/models/question_model.dart';
import 'package:UpworkAssessment/modules/onboarding/widgets/age_weight_question.widget.dart';
import 'package:UpworkAssessment/modules/onboarding/widgets/option_question.dart';
import 'package:UpworkAssessment/modules/onboarding/widgets/signup_section.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionairPage extends StatefulWidget {
  const QuestionairPage({super.key});

  @override
  State<QuestionairPage> createState() => _QuestionairPageState();
}

class _QuestionairPageState extends State<QuestionairPage> {
  var controller = Get.find<OnbaordingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OnbaordingController>(
            id: 'questions',
            builder: (logic) {
              return Column(
                children: [
                  appBar(logic),
                  20.hp,
                  Expanded(
                    child: PageView.builder(
                        onPageChanged: logic.changeCurrentQuestion,
                        controller: logic.questionController,
                        itemCount: (controller.questions?.length ?? 0) + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          if (i == (controller.questions?.length)) {
                            return SignupWidget();
                          }
                          QuestionModel? question = controller.questions?[i];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.hp,
                              Text(
                                question?.question ?? '',
                                style: AppTextStyles.instance
                                    .headingText(size: 25),
                              ),
                              Spacer(),
                              if (question?.type == 'option' &&
                                  question?.category == 'pick-one') ...[
                                OptionQuestionMcqs(question: question)
                              ],
                              if (question?.type == 'custom' &&
                                  question?.category == 'age-and-weight') ...[
                                AgeAndWeightQuestion(
                                  question: question,
                                )
                              ],
                              Spacer(
                                flex: 1,
                              ),
                              AppButton(
                                isDisabled: question?.answer == null,
                                title: 'Next',
                                onTap: () {
                                  controller.nextQuestion();
                                },
                                borderRadius: 100,
                                elevation: 0,
                              )
                            ],
                          );
                        }),
                  )
                ],
              ).paddingAll(20.w);
            }),
      ),
    );
  }

  Row appBar(OnbaordingController logic) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.PreviousQuestion();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.instance.primaryColor,
          ),
        ),
        10.wp,
        Expanded(
            child: LinearProgressIndicator(
          value: (logic.currentQuestion + 1) /
              ((logic.questions?.length ?? 0) + 1),
          backgroundColor: AppColors.instance.disabledColor,
          color: AppColors.instance.primaryColor,
        )),
        20.wp,
      ],
    );
  }
}
