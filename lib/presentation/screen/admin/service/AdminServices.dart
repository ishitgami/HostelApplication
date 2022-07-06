import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:hostelapplication/presentation/screen/admin/service/adminPendingServiceList.dart';

class AdminServicesScreen extends StatefulWidget {
  const AdminServicesScreen({Key? key}) : super(key: key);

  @override
  State<AdminServicesScreen> createState() => _AdminServicesScreenState();
}

class _AdminServicesScreenState extends State<AdminServicesScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Services'),
      ),
      drawer: const AdminDrawer(),
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPendingServiceListScreen(imagesText[index])));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
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
