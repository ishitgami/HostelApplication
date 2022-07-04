// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/presentation/screen/admin/complaint/approveDenyCompScreen.dart';
import 'package:provider/provider.dart';

class PendingComplainListScreen extends StatelessWidget {
  PendingComplainListScreen(this.complaintTitle, {Key? key}) : super(key: key);
  String complaintTitle;
  @override
  Widget build(BuildContext context) {
    List<Complaint> complaintList = [];
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
    complaintListRaw?.forEach(
      (element) {
        if (complaintTitle == element.complaintTitle && element.status == 0) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor:
          complaintList.length != 0 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        title: Text('$complaintTitle complaints'),
      ),
      body: complaintList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApproveDenyComplainList(
                                  complaintList[index])));
                    },
                    child: Card(
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
                                      complaintList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                        'Room - ${complaintList[index].roomNo}'),
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
                                          color: Color.fromARGB(
                                            255,
                                            214,
                                            108,
                                            22,
                                          ),
                                        ),
                                      )
                                    : complaintList[index].status == 1
                                        ? Text('Approved',
                                            style:
                                                TextStyle(color: Colors.green))
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
                          ],
                        ),
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
                    'No Complaints :)',
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
