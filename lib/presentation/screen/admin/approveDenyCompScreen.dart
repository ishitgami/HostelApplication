import 'package:flutter/material.dart';

class ApproveDenyComplainList extends StatelessWidget {
  const ApproveDenyComplainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tablepadding = EdgeInsets.all(15);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Approve/Denny Services'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, left: 18, right: 18, bottom: 50),
              child: Container(
                // padding: EdgeInsets.all(1),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Table(
                          // defaultColumnWidth: FixedColumnWidth(120.0),
                          columnWidths: const {
                            0: FixedColumnWidth(120),
                            1: FlexColumnWidth(),
                          },
                          border: TableBorder.all(
                              color: Colors.grey,
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
                                    'Ishit Gami',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Room No.',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    '510',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Date',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    '01 July 2022',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )
                                ]),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Services ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(":"),
                        Text(
                          " Room",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Color.fromARGB(157, 158, 158, 158)),
                      ),
                      child: const Text(
                          'Kindy Request to repair my room table:).'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 1,
                              ),
                              height: 50,
                              color: Colors.red[400],
                              child: const Center(
                                child: Text(
                                  'Denny',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 1),
                              height: 50,
                              color: Colors.green[400],
                              child: const Center(
                                child: Text(
                                  'Approve',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
