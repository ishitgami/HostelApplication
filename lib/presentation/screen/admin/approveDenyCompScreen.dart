import 'package:flutter/material.dart';

class ApproveDenyComplainList extends StatelessWidget {
  const ApproveDenyComplainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tablepadding = EdgeInsets.all(15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approve/Denny'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18, right: 18, bottom: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                         Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(183, 235, 237, 237),
                    ),
                    child: Table(
                      // defaultColumnWidth: FixedColumnWidth(120.0),
                      columnWidths: const {
                        0: FixedColumnWidth(120),
                        1: FlexColumnWidth(),
                      },
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Center(
                                child: Text(
                                  'Name',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            ]),
                          ),
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Text(
                                'G.Ishit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )
                            ]),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Text(
                                'Hostel',
                                style: TextStyle(fontSize: 18),
                              )
                            ]),
                          ),
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Text(
                                'Abdul kalam illam',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )
                            ]),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Text(
                                'Floor',
                                style: TextStyle(fontSize: 18),
                              )
                            ]),
                          ),
                          Padding(
                            padding: tablepadding,
                            child: Column(children: const [
                              Text(
                                'Second Floor',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              )
                            ]),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Complaint ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(":"),
                            Text(
                              " Electricity",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                hintText: "Type your complaint here...... 🖍",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            maxLength: 1000,
                            cursorColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 20,
                  child: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
