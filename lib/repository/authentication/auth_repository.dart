import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prac2/pages/home.dart';
import 'package:prac2/pages/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  /*@override
  void OnReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }*/

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const MyLogin())
        : Get.offAll(() => const MyHome());
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
    } catch (_) {}
  }

  Future<void> loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
