import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/models/question_model.dart';

class OptionQuestionMcqs extends GetView<OnbaordingController> {
  const OptionQuestionMcqs({
    super.key,
    required this.question,
  });

  final QuestionModel? question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(question?.options?.length ?? 0, (k) {
        bool isSelected = question?.answer == question?.options?[k];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () {
              question?.answer = question?.options?[k] ?? '';
              controller.update(['questions']);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.instance.primaryColor
                      : AppColors.instance.disabledColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                question?.options?[k] ?? '',
                style: AppTextStyles.instance.subHeadingText(
                    size: 18,
                    color: isSelected
                        ? AppColors.instance.white
                        : AppColors.instance.primaryColor),
              ),
            ),
          ),
        );
      }),
    );
  }
}
