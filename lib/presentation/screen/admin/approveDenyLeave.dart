import 'package:flutter/material.dart';

class ApproveDennyLeaveScreen extends StatefulWidget {
  ApproveDennyLeaveScreen({Key? key}) : super(key: key);

  @override
  State<ApproveDennyLeaveScreen> createState() => _ApproveDennyLeaveScreenState();
}

class _ApproveDennyLeaveScreenState extends State<ApproveDennyLeaveScreen> {
  @override
  Widget build(BuildContext context) {
     const tablepadding = EdgeInsets.all(15);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        title: const Text('Approve/Denny',style: TextStyle(color: Colors.black),),
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
                                    'Date of leaving',
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
                            TableRow(children: [
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    'Date Of coming',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    '10 July 2022',
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
                                    'Total Day',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: tablepadding,
                                child: Column(children: const [
                                  Text(
                                    '10',
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
                    const Text(
                      " Leave Reason",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
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
                        border: Border.all(width: 2, color: const Color.fromARGB(157, 158, 158, 158)),
                      ),
                      child: const Text(
                          'I am Seetha Suresh, a final year student of BSc Chemistry with the ID number 18PEL54. I stay in Room no. F2. I am writing this letter to request you to permit me to go home for ten days (01/07/2022 – 10/07/2022). I will be back to the hostel on Monday morning (11/07/2022).'),
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