import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:provider/provider.dart';

class AdminLeaveScreen extends StatefulWidget {
  const AdminLeaveScreen({Key? key}) : super(key: key);

  @override
  State<AdminLeaveScreen> createState() => _AdminLeaveScreenState();
}

class _AdminLeaveScreenState extends State<AdminLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Leave> Leavelist = [];
    final leaveListRaw = Provider.of<List<Leave>?>(context);
    leaveListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentId && element.status == 0) {
        Leavelist.add(element);
      }
      ;
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Leave'),
        ),
        drawer: const AdminDrawer(),
        body: Leavelist != []
            ? ListView.builder(
                itemCount: Leavelist.length,
                itemBuilder: (BuildContext context, int index) {
                  return adminleavelistmodel(
                      studentname: Leavelist[index].name,
                      roomno: Leavelist[index].roomNo);
                },
              )
            : Center(child: CircularProgressIndicator()));
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, approveDennyLeaveScreenRoute);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Ishit Gami',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('Room No. : 510'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
