import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatelessWidget {
  const AdminDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String studentname = "Admin";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profileimage.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "$studentname ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(183, 235, 237, 237),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Hostel',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      DataColumn(
                          label: Text(
                        ':   Abdul Kalam illam',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Department')),
                        DataCell(Text(':   CSE')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Role')),
                        DataCell(Text(':   Rector')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Phone No')),
                        DataCell(Text(':   9991001999')),
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
