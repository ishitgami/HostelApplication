// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/approveDenyLeave.dart';
import 'package:hostelapplication/presentation/screen/admin/leave/declineApproveLeaveListScreen.dart';
import 'package:provider/provider.dart';

class AdminLeaveScreen extends StatefulWidget {
  const AdminLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AdminLeaveScreen> createState() => _AdminLeaveScreenState();
}

class _AdminLeaveScreenState extends State<AdminLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    List<Leave> leaveList = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach(
      (element) {
        if (element.status == 0) {
          leaveList.add(element);
        } else null;
        ;
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          
          title: const Text('Leave'),
        ),
        drawer: const AdminDrawer(),
        body: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              leaveList.length == 0 ? 
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nodata.jpg',
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    'No Leave Request :)',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            )
              : 
              Container(
                padding: EdgeInsets.only(bottom: 120),
                child: ListView.builder(
                  itemCount: leaveList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ApproveDennyLeaveScreen(leaveList[index])));
                      },
                      child: adminleavelistmodel(
                          studentname: leaveList[index].name,
                          roomno: leaveList[index].roomNo),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeclineApproveLeaveListScreen(1),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Apporoved Leaves',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DeclineApproveLeaveListScreen(2),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Declined Leaves',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class adminleavelistmodel extends StatelessWidget {
  adminleavelistmodel(
      {required this.studentname, required this.roomno, Key? key})
      : super(key: key);
  String studentname;
  String roomno;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$studentname",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text('Room No. : $roomno'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
