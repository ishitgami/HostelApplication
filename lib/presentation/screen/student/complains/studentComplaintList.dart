import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/provider/complaint_provider.dart';
import 'package:provider/provider.dart';

class StudentComplaintListScreen extends StatelessWidget {
  const StudentComplaintListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Complaint> complaintList = [];
    final complaintProvider = Provider.of<ComplaintProvider>(context);
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
    complaintListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid) {
        complaintList.add(element);
      }
      ;
    });

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Your Complaint'),
        ),
        body: complaintList != []
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: complaintList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        content: Text(
                                            "Are you sure you want to delete ?"),
                                        actions: [
                                          TextButton(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              complaintProvider.deleteComplaint(
                                                  complaintList[index].id);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black54,
                                  ),
                                ),
                                Container(
                                  color: Color.fromARGB(173, 0, 0, 0),
                                  height: 30,
                                  width: 2,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(complaintList[index].complaintTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17)),
                                    Text(
                                      complaintList[index].time.day.toString() +
                                          '/' +
                                          complaintList[index]
                                              .time
                                              .month
                                              .toString() +
                                          '/' +
                                          complaintList[index]
                                              .time
                                              .year
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                complaintList[index].status == 0
                                    ? Text(
                                        'Pending',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 214, 108, 22),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : complaintList[index].status == 1
                                        ? Text(
                                            'Approved',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        : Text(
                                            'Declined',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Divider(height: 2),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                complaintList[index].complaint,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
