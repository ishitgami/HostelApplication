import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentComplainScreen extends StatefulWidget {
  const StudentComplainScreen({Key? key}) : super(key: key);

  @override
  State<StudentComplainScreen> createState() => _StudentComplainScreenState();
}

class _StudentComplainScreenState extends State<StudentComplainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complain'),
      ),
      drawer: const StudentDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          Text('dewdwdwdw'),
          Text('dewdwdwdw'),
        ],
      )),
    );
  }
}
