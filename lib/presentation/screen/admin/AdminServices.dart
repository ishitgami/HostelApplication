import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';

class AdminServicesScreen extends StatefulWidget {
  const AdminServicesScreen({Key? key}) : super(key: key);

  @override
  State<AdminServicesScreen> createState() => _AdminServicesScreenState();
}

class _AdminServicesScreenState extends State<AdminServicesScreen> {
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
            Text('ssx')
          ],
        ),
      ),
    );
  }
}