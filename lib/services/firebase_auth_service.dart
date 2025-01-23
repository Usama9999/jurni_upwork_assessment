import 'package:firebase_auth/firebase_auth.dart';

class FirestoreAuthService {
  static FirestoreAuthService instance = FirestoreAuthService._();
  FirestoreAuthService._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? get userId => _firebaseAuth.currentUser?.uid;
}
