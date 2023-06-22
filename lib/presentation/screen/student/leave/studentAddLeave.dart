// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/leave_provider.dart';
import 'package:provider/provider.dart';

class StudentAddLeave extends StatefulWidget {
  const StudentAddLeave({Key? key}) : super(key: key);

  @override
  State<StudentAddLeave> createState() => _StudentAddLeaveState();
}

class _StudentAddLeaveState extends State<StudentAddLeave> {
  DateTime leavingDate = DateTime.now().add(Duration(days: 1));
  DateTime commingDate = DateTime.now().add(Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    final userList = Provider.of<List<UserData>?>(context);
    final leaveProvider = Provider.of<LeaveProvider>(context);
    Iterable<UserData>? userData =
        userList?.where((element) => user!.uid == element.id);

    const tablepadding = EdgeInsets.all(15);
    int totalday = commingDate.difference(leavingDate).inDays;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: const Text(
              'Leave',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
        body: userData != null
            ? Container(
                color: Colors.white,
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 12, right: 12, bottom: 50),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          width: 1),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: tablepadding,
                                            child: Column(children: const [
                                              Center(
                                                child: Text(
                                                  'Name',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              )
                                            ]),
                                          ),
                                          Padding(
                                            padding: tablepadding,
                                            child: Column(children: [
                                              Text(
                                                userData.first.firstName +
                                                    ' ' +
                                                    userData.first.lastName,
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
                                            child: Column(children: [
                                              Text(
                                                userData.first.roomNo,
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
                                              Text("${leavingDate.toLocal()}"
                                                  .split(' ')[0]),
                                              TextButton(
                                                  onPressed: () async {
                                                    final DateTime? picked =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate: leavingDate,
                                                      firstDate: leavingDate,
                                                      lastDate: leavingDate.add(
                                                          Duration(days: 30)),
                                                    );

                                                    if (picked != null &&
                                                        picked != leavingDate) {
                                                      setState(() {
                                                        leavingDate = picked;
                                                      });
                                                    }

                                                    leaveProvider
                                                        .changeLeavingDate(
                                                            leavingDate);
                                                  },
                                                  child: Text(
                                                    'Select date',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .blue.shade900),
                                                  )),
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
                                              Text("${commingDate.toLocal()}"
                                                  .split(' ')[0]),
                                              TextButton(
                                                onPressed: () async {
                                                  final DateTime? picked =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              leavingDate,
                                                          firstDate:
                                                              DateTime.now()
                                                                  .add(Duration(
                                                                      days: 2)),
                                                          lastDate: leavingDate
                                                              .add(Duration(
                                                                  days: 30)));

                                                  if (picked != null &&
                                                      picked != commingDate) {
                                                    setState(() {
                                                      commingDate = picked;
                                                    });
                                                  }
                                                  leaveProvider
                                                      .changeComingDate(
                                                          commingDate);
                                                },
                                                child: Text(
                                                  'Select date',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blue.shade900),
                                                ),
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
                                            child: Column(
                                                children: [Text("$totalday")]),
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
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: TextFormField(
                                    onChanged: (value) => {
                                      leaveProvider.changeLeaveReason(value)
                                    },
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        hintText:
                                            "Type your Leave Reason here...... 🖍",
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    maxLines: 7,
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
                                        onTap: () {
                                          leaveProvider.changeName(
                                              userData.first.firstName +
                                                  ' ' +
                                                  userData.first.lastName);
                                          leaveProvider.changeRoomNo(
                                              userData.first.roomNo);
                                          leaveProvider.changeTotalDay(
                                              commingDate
                                                  .difference(leavingDate)
                                                  .inDays);
                                          leaveProvider.changeStudentUid(
                                              userData.first.id);

                                          leaveProvider.saveLeave();
                                          Navigator.pushNamed(context,
                                              studentDashboardScreenRoute);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade900,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
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
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
