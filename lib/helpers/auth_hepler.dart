import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._pc();

  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._pc();

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

  Future<GoogleSignInAccount?> googleSignIn() async {
    GoogleSignInAccount? account = await googleSignIn.;
    GoogleSignInAuthentication authentication = await account!.authentication;
    AuthCredential credential = GoogleAuthCredential.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
    // if(account!=null){
    //   return true;
    // }
    // else{
    //   return false;
    // }
    return account;
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

// FirebaseFirestore databse = FirebaseFirestore.instance;
//
//   // addStudent({required FireStoreModal fireStoreModal}) {
//   //   final user = <String, dynamic>{
//   //     // "age": fireStoreModal.age,
//   //     "id": fireStoreModal.id,
//   //     "name": fireStoreModal.name,
//   //   };
//   //   db.collection("student").add(user).then(
//   //         (DocumentReference doc) => log(
//   //           'DocumentSnapshot added with ID: ${doc.id}',
//   //         ),
//   //       );
//   // }
//
//   addData() {
//     final user = <String, dynamic>{
//       "age": 19,
//       "id": 102,
//       "name": "ved",
//     };
//     db.collection("student").add(user).then(
//           (DocumentReference doc) =>
//               log('DocumentSnapshot added with ID: ${doc.id}'),
//         );
//   }
//
//   readData() async {
//     return await db.collection("users").get().then((event) {
//       for (var doc in event.docs) {
//         log("${doc.id} => ${doc.data()}");
//       }
//     });
//   }
//
// // addStudent({required FireStoreModal fireStoreModal}) {
// //   final user = <String, dynamic>{
// //     // "age": fireStoreModal.age,
// //     "id": fireStoreModal.id,
// //     "name": fireStoreModal.name,
// //   };
// //   db.collection("student").add(user).then(
// //         (DocumentReference doc) =>
// //         log(
// //           'DocumentSnapshot added with ID: ${doc.id}',
// //         ),
// //   );
// // }
//
// // addData() {
// //   final user = <String, dynamic>{
// //     "age": 19,
// //     "id": 102,
// //     "name": "ved",
// //   };
// //   db.collection("student").add(user).then(
// //         (DocumentReference doc) =>
// //         log('DocumentSnapshot added with ID: ${doc.id}'),
// //   );
// // }
//
// // readData() async {
// //   return await db.collection("users").get().then((event) {
// //     for (var doc in event.docs) {
// //       log("${doc.id} => ${doc.data()}");
// //     }
// //   });
// // }
}

class GoogleSignInAccount {}
