// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login.png',
                  height: 300.0,
                  width: 300.0,
                ),
              ),
              Container(
                child: const Text(
                  'WELCOME.',
                  style: TextStyle(
                      fontSize: 35,
                      color: const Color.fromARGB(255, 108, 99, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
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
              const TextField(
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,registrationScreenRoute);
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
    );
  }
}
