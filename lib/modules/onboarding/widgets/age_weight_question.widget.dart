import 'package:UpworkAssessment/extensions/sized_box.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/models/question_model.dart';
import 'package:flutter/cupertino.dart';

class AgeAndWeightQuestion extends StatelessWidget {
  const AgeAndWeightQuestion({super.key, required this.question});

  final QuestionModel? question;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnbaordingController>(
        id: 'questions',
        initState: (_) {
          question?.answer = {'age': '10', 'weight': '41-50'};
          _.controller?.update(['questions']);
        },
        builder: (logic) {
          return Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Your age',
                        style: AppTextStyles.instance.subHeadingText(size: 20),
                      ),
                      10.hp,
                      Expanded(
                        child: CupertinoPicker(
                          magnification: 1.2,

                          children: logic.age
                              .map((e) => Center(
                                    child: Text(
                                      "$e",
                                      style:
                                          AppTextStyles.instance.normalText(),
                                    ),
                                  ))
                              .toList(),
                          itemExtent: 30, //height of each item
                          looping: true,
                          onSelectedItemChanged: (int index) {
                            question?.answer['age'] = logic.age[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Weight',
                        style: AppTextStyles.instance.subHeadingText(size: 20),
                      ),
                      10.hp,
                      Expanded(
                        child: CupertinoPicker(
                          magnification: 1.2,

                          children: logic.weight
                              .map((e) => Center(
                                    child: Text(
                                      "$e lbs",
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.instance.regular(),
                                    ),
                                  ))
                              .toList(),
                          itemExtent: 30, //height of each item

                          looping: true,
                          onSelectedItemChanged: (int index) {
                            question?.answer['weight'] = logic.age[index];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
