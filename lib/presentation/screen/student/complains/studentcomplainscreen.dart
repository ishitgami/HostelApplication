import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/complains/StudentPastComplaint.dart';
import 'package:hostelapplication/presentation/screen/student/complains/studentAddComplain.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentComplainScreen extends StatefulWidget {
  const StudentComplainScreen({Key? key}) : super(key: key);

  @override
  State<StudentComplainScreen> createState() => _StudentComplainScreenState();
}

class _StudentComplainScreenState extends State<StudentComplainScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<String> images = [
    'assets/images/water-bottle.png',
    'assets/images/electrical-energy.png',
    'assets/images/chef.png',
    'assets/images/insects.png',
    'assets/images/other.png'
  ];
  List<String> imagesText = [
    'Water',
    'Electricity',
    'Worker',
    'Bugs & Insects',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Complain',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentPastComplaintScreen()));
        },
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.comment),
      ),
      drawer: const StudentDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentAddComplaintScreen(
                            imagesText[index], user!.uid)));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.black, width: 0.1)),
                color: Colors.white,
                elevation: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        images[index],
                        height: 70,
                        width: 70,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: Text(
                        textAlign: TextAlign.center,
                        imagesText[index].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue.shade900),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
