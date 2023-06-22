import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:provider/provider.dart';

class StudentApproveDennyLeaveList extends StatelessWidget {
  const StudentApproveDennyLeaveList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> leaveList = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);

    leaveListRaw?.forEach(
      (element) {
        if (element.studentUid == auth.currentUser?.uid &&
            (element.status == 2 || element.status == 1)) {
          leaveList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: leaveList.length != 0 ? Colors.white : Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            'Leave',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      drawer: const StudentDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Navigator.pushNamed(context, studentLeaveScreenRoute);
        },
        child: Icon(Icons.add),
      ),
      body: leaveList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: leaveList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    leaveList[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text('Room - ${leaveList[index].roomNo}'),
                                  Text(
                                    leaveList[index]
                                            .leaveApplyDate
                                            .day
                                            .toString() +
                                        '/' +
                                        leaveList[index]
                                            .leaveApplyDate
                                            .month
                                            .toString() +
                                        '/' +
                                        leaveList[index]
                                            .leaveApplyDate
                                            .year
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              leaveList[index].status == 0
                                  ? Text(
                                      'Pending',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          214,
                                          108,
                                          22,
                                        ),
                                      ),
                                    )
                                  : leaveList[index].status == 1
                                      ? Text('Approved',
                                          style: TextStyle(color: Colors.green))
                                      : Text(
                                          'Declined',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                87,
                                238,
                                238,
                                238,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(
                                  157,
                                  158,
                                  158,
                                  158,
                                ),
                              ),
                            ),
                            child: Text(
                              leaveList[index].leaveReason,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nodata.jpg',
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    'No Past Leave :)',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }
}
