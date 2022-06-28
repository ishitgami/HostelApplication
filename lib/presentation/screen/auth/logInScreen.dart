// ignore_for_file: unnecessary_const


import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/auth_service.dart';
import 'package:provider/provider.dart';


class LogInScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
     final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/login.png',
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 108, 99, 255),
                      height: 100,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'My\nHostel',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 108, 99, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: 'Roboto'),
                    ),
                  ],
                ),
                const Text(
                  'WELCOME.',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                 TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 108, 99, 255),
                              border: Border.all(
                                color: const Color.fromARGB(255, 108, 99, 255),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        onTap: () async{
                          await authService.signInWithEmailAndPassword(emailController.text..toString(), passwordController.text..toString());
                           Navigator.pushNamed(
                              context, adminDashbordScreenRoute)
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, registrationScreenRoute);
                        },
                        child: const Text(
                          'Not Registred yet?',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
