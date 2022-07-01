import 'package:firebase_auth/firebase_auth.dart';

class FireBaseUser {
  final String uid;
  final String? email;

  FireBaseUser({
    required this.uid,
    this.email,
  });
}
