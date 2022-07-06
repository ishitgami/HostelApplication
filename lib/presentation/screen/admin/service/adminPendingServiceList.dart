// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:hostelapplication/presentation/screen/admin/service/approveDennyService.dart';
import 'package:provider/provider.dart';

class AdminPendingServiceListScreen extends StatelessWidget {
  AdminPendingServiceListScreen(this.serviceTitle);

  String serviceTitle;

  @override
  Widget build(BuildContext context) {
    List<Service> serviceList = [];
    final serviceListRaw = Provider.of<List<Service>?>(context);
    serviceListRaw?.forEach(
      (element) {
        if (element.status == 0 && serviceTitle == element.serviceTitle) {
          serviceList.add(element);
        }
        ;
      },
    );
    return Scaffold(
      backgroundColor:
          serviceList.length != 0 ? Colors.grey[200] : Colors.white,
      appBar: AppBar(
        title: Text('Pending Services'),
      ),
      body: serviceList.length != 0
          ? Container(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ApproveDennyServiceSceen(
                                  serviceList[index])));
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
                                      serviceList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                        'Room - ${serviceList[index].roomNo}'),
                                    Text(
                                      serviceList[index].time.day.toString() +
                                          '/' +
                                          serviceList[index]
                                              .time
                                              .month
                                              .toString() +
                                          '/' +
                                          serviceList[index]
                                              .time
                                              .year
                                              .toString(),
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
