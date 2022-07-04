// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:provider/provider.dart';

class DeclineApproveListScreen extends StatelessWidget {
  DeclineApproveListScreen(this.complainStatus, {Key? key}) : super(key: key);
  int complainStatus;

  @override
  Widget build(BuildContext context) {
    List<Complaint> complaintList = [];
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
   
    complaintListRaw?.forEach(
      (element) {
        if (element.status == complainStatus) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor:
          complaintList.length != 0 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        title: complainStatus == 1
            ? Text('Approved complaints')
            : Text('Declined complaints'),
      ),
      body: complaintList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
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
                                  Text('Room - ${complaintList[index].roomNo}'),
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
