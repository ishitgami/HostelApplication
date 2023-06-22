import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/modules/user_model.dart';
import 'package:hostelapplication/logic/provider/userData_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late AuthService authService;
  bool showLoading = false;
  bool showAlert = false;

  //for storing form state.
  final _form = GlobalKey<FormState>();

  //saving form after validation
  void _saveForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
  }

  final colors = Color(0xff96C3E2);
  @override
  Widget build(BuildContext context) {
    authService = Provider.of<AuthService>(context);
    final userDataProvider = Provider.of<UsereDataProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _form,
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'My Hostel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  fontFamily: 'Brazila'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'WELCOME',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Brazila'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            onChanged: (((value) =>
                                userDataProvider.changeFirstName(value))),
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Enter First Name ";
                              }
                              return null;
                            },
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Brazila",
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                              ),
                              hintText: "First Name",
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Brazila",
                              ),
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
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            onChanged: (((value) =>
                                userDataProvider.changeLastName(value))),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Enter Last Name ";
                              }
                              return null;
                            },
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Brazila",
                            ),
                            controller: lastNameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                              ),
                              hintStyle: const TextStyle(color: Colors.white),
                              isDense: true,
                              hintText: "Last Name",
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
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (((value) =>
                              userDataProvider.changeMobileNo(value))),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Enter Mobile number ";
                            }
                            return null;
                          },
                          controller: mobileNoController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Brazila",
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            hintStyle: const TextStyle(color: Colors.white),
                            isDense: true,
                            hintText: 'Mobile No.',
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (((value) =>
                              userDataProvider.changeRoomNo(value))),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Enter Valid Room No";
                            }
                            return null;
                          },
                          controller: roomNoController,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Brazila",
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Room No',
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (((value) =>
                              userDataProvider.changeEmail(value))),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Brazila",
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Brazila",
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            hintText: 'Password',
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
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: colors,
                                      border: Border.all(
                                        color: colors,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: "Brazila",
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                                onTap: () async {
                                  _saveForm();
                                  setState(() {
                                    showLoading = true;
                                  });
                                  progressIndicater(
                                      context, showLoading = true);
                                  FireBaseUser? user = await createUser();
                                  userDataProvider.changeId(user!.uid);
                                  userDataProvider.saveUserData();
                                  await showAlert == true
                                      ? null
                                      : progressIndicater(
                                          context, showLoading = true);
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, logInScreenRoute);
                                },
                                child: const Text(
                                  'Already Registred?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Brazila",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
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

  createUser() async {
    try {
      FireBaseUser? user = await authService.createUserWithEmailAndPassword(
          emailController.text.toString(), passwordController.text.toString());

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, logInScreenRoute);
      return user;
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
      padding: EdgeInsets.only(left: 10, right: 10),
      title: "ALERT",
      style: AlertStyle(
        descTextAlign: TextAlign.center,
      ),
      desc: e.toString(),
    ).show();
  }
}

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(105, 107, 99, 255),
            Color.fromARGB(105, 212, 65, 141),
          ], begin: Alignment.topLeft, end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 7, size.height - 30);
    var firstEndPoint = Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
