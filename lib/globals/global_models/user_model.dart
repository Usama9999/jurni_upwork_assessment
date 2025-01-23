import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String email;
  late String name;
  late String gender;
  late String birth;
  late dynamic response;
  List<String>? badges;
  num? points;
  String? picture;
  bool? preferLongVideo;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.response,
      this.points,
      this.badges,
      required this.gender,
      required this.birth,
      this.picture,
      this.preferLongVideo});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map d = doc.data() as Map;
    try {
      id = d['uid'] ?? '';
      badges = ((d['badges'] ?? []) as List).map((i) => i.toString()).toList();
      name = d['name'] ?? '';
      response = d['response'];
      points = d['points'];
      gender = d['gender'] ?? '';
      birth = d['birth'] ?? '';
      picture = d['picture'] ?? '';
      email = d['email'] ?? '';
      preferLongVideo = d['preferLongVideo'] ?? true;
    } catch (e) {
      print(e);
    }
  }
}
