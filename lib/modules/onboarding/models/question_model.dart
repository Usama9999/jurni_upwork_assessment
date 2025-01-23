import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String? questionId;
  String? question;
  String? type;
  dynamic answer;
  String? category;
  List<String>? options;
  QuestionModel({
    this.questionId,
    this.question,
    this.type,
    this.category,
    this.options,
  });

  QuestionModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map d = doc.data() as Map;
    try {
      questionId = doc.id;
      options =
          ((d['options'] ?? []) as List).map((i) => i.toString()).toList();
      type = d['type'];
      question = d['question'];
      category = d['category'];
    } catch (e) {
      throw e;
    }
  }
}
