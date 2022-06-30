import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/core/constant/string.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String studentname = "Student Name";
    String studentenroll = "Student Enroll";
    String hostelname = "Hostel Name";
    String roomno = "Room No";
    String department = "Department";
    String phoneno = "Phone No";

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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 75,
                          height: 65,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/profileimage.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$studentname",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "$studentenroll",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 260,
                      height: 155,
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
                              children: [
                                Text(
                                  'Hostel             ',
                                  style: studentDrawerText,
                                ),
                                Text(':', style: studentDrawerText),
                                Text('     $hostelname',
                                    style: studentDrawerText),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Room No        ',
                                    style: studentDrawerText),
                                Text(':'),
                                Text('     $roomno', style: studentDrawerText),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Department   ', style: studentDrawerText),
                                Text(':', style: studentDrawerText),
                                Text('     $department',
                                    style: studentDrawerText),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Phone No       ',
                                    style: studentDrawerText),
                                Text(':', style: studentDrawerText),
                                Text('     $phoneno', style: studentDrawerText),
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
            Divider(),
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
    String Complaintdate = "01/01/2022";
    String Complainttype = "Electricity";
    String Compiantdesc =
        "In my Hostel, there is low voltage power occurs most of time.Kindly solve our problem :).";
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
                              children: [
                                Text(
                                  "Date ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(":"),
                                Text(
                                  " $Complaintdate",
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
                          children: [
                            Text(
                              "Complaint ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(":"),
                            Text(
                              " $Complainttype",
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
                          child: Text('$Compiantdesc'),
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
