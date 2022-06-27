import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String? email;

  User({
    required this.uid,
    this.email,
  });
}
