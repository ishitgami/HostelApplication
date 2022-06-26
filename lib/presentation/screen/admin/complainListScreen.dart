import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';

class ComplainListScreen extends StatefulWidget {
  ComplainListScreen({Key? key}) : super(key: key);

  @override
  State<ComplainListScreen> createState() => _ComplainListScreenState();
}

class _ComplainListScreenState extends State<ComplainListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('List of complains'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, approveDenyComplainListRoute);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Room No : 503', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text('Ishit Gami'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
