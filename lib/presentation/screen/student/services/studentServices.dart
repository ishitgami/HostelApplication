import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/presentation/screen/student/services/StudentPastService.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentServicesScreen extends StatefulWidget {
  const StudentServicesScreen({Key? key}) : super(key: key);

  @override
  State<StudentServicesScreen> createState() => _StudentServicesScreenState();
}

class _StudentServicesScreenState extends State<StudentServicesScreen> {
  List<String> images = [
    'assets/images/room.png',
    'assets/images/dinner.png',
    'assets/images/bath.png',
    'assets/images/thunderbolt.png',
    'assets/images/other.png'
  ];
  List<String> imagesText = [
    'Room',
    'Mess',
    'Bathroom',
    'Electricity',
    'Other'
  ];

  List navigatorRoute = [
    studentRoomServiceRoute,
    studentMessServiceRoute,
    studentBathRoomServiceRoute,
    studentElectricityServiceRoute,
    studentOtherServiceRoute,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Services',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StudentPastServiceScreen()));
        },
        child: Icon(Icons.comment),
      ),
      drawer: const StudentDrawer(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, navigatorRoute[index]);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.black, width: 0.1)),
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
