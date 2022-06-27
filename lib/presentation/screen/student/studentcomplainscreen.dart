import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
<<<<<<< HEAD
=======
import 'package:hostelapplication/presentation/screen/student/complains/studentAddComplain.dart';
>>>>>>> 37540ae48e821eb4990351b828411bc394f85046
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentComplainScreen extends StatefulWidget {
  const StudentComplainScreen({Key? key}) : super(key: key);

  @override
  State<StudentComplainScreen> createState() => _StudentComplainScreenState();
}

class _StudentComplainScreenState extends State<StudentComplainScreen> {
<<<<<<< HEAD
  List<String> images = [
=======
   List<String> images = [
>>>>>>> 37540ae48e821eb4990351b828411bc394f85046
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
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.grey[200],
=======
       backgroundColor: Colors.grey[200],
>>>>>>> 37540ae48e821eb4990351b828411bc394f85046
      appBar: AppBar(
        title: const Text('Complain'),
      ),
      drawer: const StudentDrawer(),
      body: Container(
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
<<<<<<< HEAD
                // Navigator.pushNamed(context, complainListScreenRoute);
=======
                Navigator.push(context, MaterialPageRoute(builder:(context)=> StudentAddComplaintScreen(imagesText[index].toString())));
>>>>>>> 37540ae48e821eb4990351b828411bc394f85046
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
