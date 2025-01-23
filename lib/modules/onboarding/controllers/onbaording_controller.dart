import 'package:UpworkAssessment/app_controllers/auth_controllers/login_controller.dart';
import 'package:UpworkAssessment/globals/imports.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onboarding_cont_repo.ex.dart';
import 'package:UpworkAssessment/modules/onboarding/models/question_model.dart';

class OnbaordingController extends GetxController {
  List<QuestionModel>? questions;
  int currentQuestion = 0;
  var authController = Get.put(AuthController());
  PageController questionController = PageController();
  int currentSlideIndex = 0;
  List<Map> sliderItems = [
    {
      'heading': 'Calorie tracking\n made easy',
      'body': "Just snap a quick photo of your meal and we'll do the rest",
      'image': 'assets/images/ic_logo.png'
    },
    {
      'heading': 'In-Depth nutrition\nanalyses',
      'body': "We will keep you inform about your food choices...",
      'image': 'assets/images/subs.png'
    },
    {
      'heading': 'Tranform your body',
      'body': "Today is the best time to start working on your dream body",
      'image': 'assets/images/ic_allset.png'
    },
  ];

  List<String> weight = [
    '41-50',
    '51-60',
    '61-70',
    '71-80',
    '81-90',
  ];
  List<String> age = [
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
  ];

  changeCurrentSlide(int a) {
    currentSlideIndex = a;
    update(['landing']);
  }

  changeCurrentQuestion(int a) {
    currentQuestion = a;
    update(['questions']);
  }

  @override
  void onInit() {
    getOnboardingQuestion();
    super.onInit();
  }

  void nextQuestion() {
    questionController.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }

  void PreviousQuestion() {
    if (currentQuestion == 0) {
      Get.back();
      return;
    }
    questionController.previousPage(
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }
}
