import 'package:UpworkAssessment/services/firestore_service.dart';

class DatabaseHelper {
  static Future<bool> isExist(String uid) async {
    return await FirestoreService.usersCollection.doc(uid).get().then((value) {
      return value.exists;
    }).catchError((e) {
      return false;
    });
  }
}
