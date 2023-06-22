// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late AuthService authService;
  bool showLoading = false;
  bool showAlert = false;

  final _formkey = GlobalKey<FormState>();
  final colors = Color(0xff96C3E2);
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              Image.asset(
                'assets/onboard/image_001.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'My\nHostel',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: 'Brazila'),
                        ),
                        Text(
                          'WELCOME.',
                          style: TextStyle(
                              fontSize: 30,
                              color: colors,
                              fontFamily: "Brazila",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Brazila'),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.white),
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(color: colors)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(color: colors)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(color: colors)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: showPassword ? true : false,
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                                color: Colors.white, fontFamily: 'Brazila'),
                            decoration: InputDecoration(
                              isDense: true,
                              hintStyle: const TextStyle(color: Colors.white),
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Icon(
                                  showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(color: colors)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(color: colors)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                      horizontal: 80, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: colors,
                                      border: Border.all(
                                        color: colors,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Brazila"),
                                  ),
                                ),
                                onTap: () async {
                                  setState(() {
                                    showLoading = true;
                                  });

                                  progressIndicater(
                                      context, showLoading = true);
                                  await loginByRole();
                                  await showAlert == true
                                      ? null
                                      : progressIndicater(
                                          context, showLoading = true);
                                  emailController.clear();
                                  passwordController.clear();
                                  Navigator.pop(context);
                                  //  Navigator.pushNamed(
                                  //     context, adminDashbordScreenRoute);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  emailController.clear();
                                  passwordController.clear();
                                  Navigator.pushNamed(
                                      context, registrationScreenRoute);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Not Registred yet?',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Brazila',
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Brazila',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    } else
      return null;
  }

  loginByRole() async {
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());
      if (emailController.text.toString() == 'admin@gmail.com') {
        Navigator.pushNamedAndRemoveUntil(
            context, adminDashbordScreenRoute, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, studentDashboardScreenRoute, (route) => false);
      }
    } catch (e) {
      return alertBox(context, e);
    }
  }

  Future<void> alertBox(BuildContext context, e) {
    setState(() {
      showLoading = false;
      showAlert = true;
    });
    return Alert(
      context: context,
      title: "ALERT",
      desc: e.toString(),
    ).show();
  }
}
