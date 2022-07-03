import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hostelapplication/logic/modules/user_model.dart';

import 'package:hostelapplication/logic/service/auth_services/authError.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

   getcurrentUser()  {
    return  _firebaseAuth.currentUser;
  }

  FireBaseUser? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return FireBaseUser(uid: user.uid, email: user.email);
  }

  Stream<FireBaseUser?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<FireBaseUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (error) {
      final errorMessage =
          ErrorHangling().throwErrorMesg(errorCode: error.code);
      throw errorMessage;
    }
  }

  Future<FireBaseUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (error) {
      final errorMessage =
          ErrorHangling().throwErrorMesg(errorCode: error.code);
      throw errorMessage;
    }
  }

  Future<void> addUserToFirestore(
      {uid, firstname, lastname, roomNo, email, enrollment}) {
    return _db.collection('User').doc(uid).set({
      'id': uid,
      'FirstName': firstname,
      'Lastname': lastname,
      'RoomNo': roomNo,
      'Email': email,
      'Enrollment': enrollment,
    });
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
