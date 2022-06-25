import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';

class AdminComplainScreen extends StatefulWidget {
  const AdminComplainScreen({Key? key}) : super(key: key);

  @override
  State<AdminComplainScreen> createState() => _AdminComplainScreenState();
}

class _AdminComplainScreenState extends State<AdminComplainScreen> {
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
       appBar: AppBar(
        title: const Text('Complain'),
      ),
      drawer: const AdminDrawer(),
      body:  Container(
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
            );
          },
        ),
      ),
    );
  }
}