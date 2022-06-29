import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:intl/intl.dart';

class StudentLeave extends StatefulWidget {
  const StudentLeave({Key? key}) : super(key: key);

  @override
  State<StudentLeave> createState() => _StudentLeaveState();
}

class _StudentLeaveState extends State<StudentLeave> {
  @override
  Widget build(BuildContext context) {
    final Currentdate = DateTime.now();
    final leavingdate = Currentdate;
    final commingdate = Currentdate.add(Duration(days: 1));

    const tablepadding = EdgeInsets.all(15);

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave'),
      ),
      drawer: const StudentDrawer(),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Form(
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
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                                  borderRadius: BorderRadius.circular(10),
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
                                    child: Column(children: [
                                      DateTimePicker(
                                        initialValue: Currentdate.toString(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(Duration(days: 30)),
                                        onChanged: (val) {
                                          final leavingdate = val;
                                          print(leavingdate);
                                        },
                                        validator: (val) {
                                          print(val);
                                          return null;
                                        },
                                        onSaved: (val) => print(val),
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
                                    child: Column(children: [
                                      DateTimePicker(
                                        initialValue: Currentdate.toString(),
                                        firstDate:
                                            leavingdate.add(Duration(days: 1)),
                                        lastDate:
                                            leavingdate.add(Duration(days: 30)),
                                        onChanged: (val) => {
                                          // commingdate = val,
                                          print(commingdate)
                                        },
                                        validator: (val) {
                                          print(val);
                                          return null;
                                        },
                                        onSaved: (val) => print(val),
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
                                    child: Column(children: [Text("")]),
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
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: TextFormField(
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText:
                                    "Type your Leave Reason here...... 🖍",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10))),
                            maxLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLength: 1000,
                            cursorColor: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green[400],
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  margin: const EdgeInsets.all(2),
                                  height: 50,
                                  child: const Center(
                                    child: Text(
                                      'Apply Leave',
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
        ),
      ),
    );
  }
}
