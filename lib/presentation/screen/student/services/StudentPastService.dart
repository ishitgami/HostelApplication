// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentPastServiceScreen extends StatelessWidget {
  StudentPastServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();

    List<Service> serviceList = [];
    final serviceListRaw = Provider.of<List<Service>?>(context);

    serviceListRaw?.forEach(
      (element) {
        print(element);
        if (user.uid == element.studentUid &&
            (element.status == 1 || element.status == 2)) {
          serviceList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor:
          serviceList.length != 0 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Past Service'),
      ),
      body: serviceList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: serviceList.length,
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
                                    serviceList[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text('Room - ${serviceList[index].roomNo}'),
                                  Text(
                                    serviceList[index].time.day.toString() +
                                        '/' +
                                        serviceList[index]
                                            .time
                                            .month
                                            .toString() +
                                        '/' +
                                        serviceList[index].time.year.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              serviceList[index].status == 0
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
                                  : serviceList[index].status == 1
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
                              serviceList[index].serviceDes,
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
