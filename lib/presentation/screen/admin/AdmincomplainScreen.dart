import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';

class AdminComplainScreen extends StatefulWidget {
  const AdminComplainScreen({Key? key}) : super(key: key);

  @override
  State<AdminComplainScreen> createState() => _AdminComplainScreenState();
}

class _AdminComplainScreenState extends State<AdminComplainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Complain'),
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
             Text('dewdwdwdw'),
               Text('dewdwdwdw'),
          ],
        )
        ),
    );
  }
}