import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/core/constant/string.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const studentDrawerText = TextStyle(fontSize: 15);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // _createHeader(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, studentDetailScreenRoute);
              },
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.account_circle_rounded),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Student',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(183, 203, 208, 211),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Role             ',
                                  style: studentDrawerText,
                                ),
                                Text(':', style: studentDrawerText),
                                Text('     Student', style: studentDrawerText),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Hostel         ',
                                    style: studentDrawerText),
                                Text(':'),
                                Text('     Hostel Name',
                                    style: studentDrawerText),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Phone No   ', style: studentDrawerText),
                                Text(':', style: studentDrawerText),
                                Text('     +91 12345 56789',
                                    style: studentDrawerText),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 50, child: Divider()),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.book,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('My Complaints'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, mycomplaintscreenRoute);
              },
            ),
            const SizedBox(width: 50, child: Divider()),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.question,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Help'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, helpscreenRoute);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.signOut,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Log out'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 50, child: Divider()),
          ],
        ),
      ),
    );
  }
}

class Mycomplaints extends StatelessWidget {
  const Mycomplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My complaints"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: const Color.fromARGB(157, 241, 241, 241),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18, right: 18, bottom: 5),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(":"),
                                Text(
                                  " 01/01/2022",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Complaint ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(":"),
                            Text(
                              " Electricity",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(157, 158, 158, 158)),
                          ),
                          child: const Text(
                              'In my Hostel, there is low voltage power occurs most of time.Kindly solve our problem :).'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 1, right: 1, bottom: 2),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Remove',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Please wait atleast two days to resolve the problems by Management.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
