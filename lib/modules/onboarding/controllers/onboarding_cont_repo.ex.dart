import 'package:UpworkAssessment/globals/enum.dart';
import 'package:UpworkAssessment/globals/global_functions.dart';
import 'package:UpworkAssessment/globals/ui_candies_functions.dart';
import 'package:UpworkAssessment/modules/onboarding/controllers/onbaording_controller.dart';
import 'package:UpworkAssessment/modules/onboarding/models/question_model.dart';
import 'package:UpworkAssessment/services/firebase_auth_service.dart';
import 'package:UpworkAssessment/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension OnboardingContRepo on OnbaordingController {
  CollectionReference get collection =>
      FirestoreService.onbaordingQuestionCollection;
  CollectionReference get userCollection => FirestoreService.usersCollection;
  void getOnboardingQuestion() async {
    try {
      questions = (await collection
              .withConverter<QuestionModel>(
                  fromFirestore: (v, _) =>
                      QuestionModel.fromDocumentSnapshot(v),
                  toFirestore: (v, _) => {})
              .orderBy('sort')
              .get())
          .docs
          .map((doc) => doc.data())
          .toList();
    } catch (e) {
      UICandiesFunction.showToastAlert(
          strMsg: GlobalFunctions.instance.handleErrorMsg(e),
          toastType: TOAST_TYPE.toastError);
    }
  }

  void saveOnbaordingResponse() async {
    try {
      userCollection.doc(FirestoreAuthService.instance.userId).set({
        'userId': FirestoreAuthService.instance.userId,
        'response': questions
            ?.map((q) => {'questionId': q.questionId, 'answer': q.answer})
            .toList()
      });
    } catch (e) {
      UICandiesFunction.showToastAlert(
          strMsg: GlobalFunctions.instance.handleErrorMsg(e),
          toastType: TOAST_TYPE.toastError);
    }
  }
}
