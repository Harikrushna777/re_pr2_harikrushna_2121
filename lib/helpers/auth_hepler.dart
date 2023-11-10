import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._pc();

  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._pc();
  FirebaseAuth auth = FirebaseAuth.instance;

  loginAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      return true;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          log("Unable to login anonymously...");
          break;
        default:
          log("Exception : ${e.code}");
      }
      return false;
    }
  }

  registerUser({required String email, required String password}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case "weak-password":
          log(e.code);
          break;
        case "email-already-in-use":
          log(e.code);
          break;
        default:
          log("Exception : ${e.code}");
      }
    }
  }

  loginWithUserNamePassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      return false;
    }
  }

  signWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      log("$user");
      return user;
    } catch (e) {
      log("$e");
    }
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
