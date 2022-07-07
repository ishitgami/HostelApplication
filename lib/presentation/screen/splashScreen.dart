import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/auth/logInScreen.dart';
import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  int loginNum = 0;
  var emailAddress;
  @override
  void initState() {
    super.initState();
    checkUserType();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => loginNum == 1
              ? AdminDashbordScreen()
              : loginNum == 2
                  ? StudentDashboardScreen()
                  : LogInScreen(),
        ),
      ),
    );
  }

  checkUserType() {
    var auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      if (user != null) {
        user = auth.currentUser;
        emailAddress = user!.email;
        if (emailAddress == 'admin@gmail.com') {
          if (this.mounted) {
            setState(() {
              loginNum = 1;
            });
          }
        } else {
          if (this.mounted) {
            setState(() {
              loginNum = 2;
            });
          }
        }
      } else {
        if (this.mounted) {
          setState(() {
            loginNum = 3;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 150,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
