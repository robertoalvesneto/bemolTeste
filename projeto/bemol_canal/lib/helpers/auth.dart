import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  signIn(String email, String password) async {}

  signUp(String email, String password) async {}

  checkSignIn() {}

  getUIDAuth() {}

  signOut() async {}
}

class FirebaseAuthh extends Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  static FirebaseAuthh? _instance = null;

  FirebaseAuthh._privateConstructor();

  static FirebaseAuthh singleton() {
    if (_instance == null) _instance = FirebaseAuthh._privateConstructor();

    return _instance!;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    bool flag = false;
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      flag = true;
    }).catchError((onError) {
      flag = false;
    });

    return flag;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    bool flag = false;
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      flag = true;
    }).catchError((onError) {
      flag = false;
    });

    return flag;
  }

  @override
  String getUIDAuth() => _auth.currentUser!.uid;

  @override
  bool checkSignIn() => (_auth.currentUser != null) ? true : false;

  Future<void> signOut() async => FirebaseAuth.instance.signOut();
}
