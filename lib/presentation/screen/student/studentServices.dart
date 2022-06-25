import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentServicesScreen extends StatefulWidget {
  const StudentServicesScreen({Key? key}) : super(key: key);

  @override
  State<StudentServicesScreen> createState() => _StudentServicesScreenState();
}

class _StudentServicesScreenState extends State<StudentServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complain'),
      ),
      drawer: const StudentDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [Text('ssx')],
        ),
      ),
    );
  }
}
