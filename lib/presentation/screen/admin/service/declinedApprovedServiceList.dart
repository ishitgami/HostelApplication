// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:provider/provider.dart';

class DeclineApproveServiceList extends StatelessWidget {
  DeclineApproveServiceList(this.serviceStatus, {Key? key}) : super(key: key);
  int serviceStatus;

  @override
  Widget build(BuildContext context) {
    List<Service> complaintList = [];
    final complaintListRaw = Provider.of<List<Service>?>(context);

    complaintListRaw?.forEach(
      (element) {
        if (element.status == serviceStatus) {
          complaintList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: serviceStatus == 1
              ? Text(
                  'Approved Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Declined Service',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
      body: complaintList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,
                        width: 0.1,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontWeight: FontWeight.bold,
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
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ))
                                      : Text(
                                          'Declined',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
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
                              complaintList[index].serviceDes,
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
