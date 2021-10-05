import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBase {
  insertUserValues({required String uid, required Map<String, dynamic> user}) {}

  getValueByUID({required String uid}) {}
}

class FireDataBase extends DataBase {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  static FireDataBase? _instance = null;

  FireDataBase._privateConstructor();

  static FireDataBase singleton() {
    if (_instance == null) _instance = FireDataBase._privateConstructor();

    return _instance!;
  }

  @override
  void insertUserValues(
          {required String uid, required Map<String, dynamic> user}) =>
      _db.collection("usuarios").doc(uid).set(user);
}
