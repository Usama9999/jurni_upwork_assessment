import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static CollectionReference _get(String name) =>
      FirebaseFirestore.instance.collection(name);
  static Query _group(String name) =>
      FirebaseFirestore.instance.collectionGroup(name);

  // constants data
  static final CollectionReference onbaordingQuestionCollection =
      _get('onboarding_questions');
  static final CollectionReference onbaordingResponsesCollection =
      _get('onboarding_responses');
  static final CollectionReference usersCollection = _get('users');
}
