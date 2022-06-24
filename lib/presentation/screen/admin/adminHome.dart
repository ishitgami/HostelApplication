import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBord'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                 color: const Color.fromARGB(183, 203, 208, 211),
                height: 150,
              ),
            )
          ],
        ),
      )),
    );
  }
}
