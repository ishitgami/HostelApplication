import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentServicesScreen extends StatefulWidget {
  const StudentServicesScreen({Key? key}) : super(key: key);

  @override
  State<StudentServicesScreen> createState() => _StudentServicesScreenState();
}

class _StudentServicesScreenState extends State<StudentServicesScreen> {
<<<<<<< HEAD
   List<String> images = [
=======
  List<String> images = [
>>>>>>> 504788b7e19677746739fe38cc76b95a3cf00dd9
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Services'),
      ),
      drawer: const StudentDrawer(),
      body:Container(
         color: Colors.grey[200],
=======
        backgroundColor: Colors.lightBlue,
        title: const Text('Services'),
      ),
      drawer: const StudentDrawer(),
      body: Container(
>>>>>>> 504788b7e19677746739fe38cc76b95a3cf00dd9
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
<<<<<<< HEAD
             
=======
              color: Colors.grey[100],
>>>>>>> 504788b7e19677746739fe38cc76b95a3cf00dd9
              elevation: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      images[index],
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      textAlign: TextAlign.center,
                      imagesText[index].toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
