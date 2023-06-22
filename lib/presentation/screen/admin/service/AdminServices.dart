import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:hostelapplication/presentation/screen/admin/service/adminPendingServiceList.dart';
import 'package:hostelapplication/presentation/screen/admin/service/declinedApprovedServiceList.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Services',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const AdminDrawer(),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: [
            Expanded(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminPendingServiceListScreen(
                                      imagesText[index])));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: Colors.black,
                            width: 0.1,
                          )),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeclineApproveServiceList(1),
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        'Apporoved Services',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeclineApproveServiceList(2),
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Text(
                        'Declined Services',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
