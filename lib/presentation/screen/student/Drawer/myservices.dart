// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:provider/provider.dart';

class Myservicesrequest extends StatelessWidget {
  const Myservicesrequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Service> servicesList = [];
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final serviceListRaw = Provider.of<List<Service>?>(context);
    serviceListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid && element.status == 0) {
        servicesList.add(element);
      }
      ;
    });
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: Text(
              "My Service Request",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: servicesList != []
            ? Padding(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return MyServiceListModel(
                      servicedate: servicesList[index].time,
                      repaireddevicelist: servicesList[index].repairDeviceList,
                      servicedesc: servicesList[index].serviceDes,
                      deleteservice: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text("Are you sure you want to delete ?"),
                            actions: [
                              TextButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  serviceProvider
                                      .deleteService(servicesList[index].id);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class MyServiceListModel extends StatelessWidget {
  MyServiceListModel(
      {required this.servicedate,
      required this.repaireddevicelist,
      required this.servicedesc,
      required this.deleteservice});
  DateTime servicedate;
  List repaireddevicelist;
  String servicedesc;
  Function deleteservice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color.fromARGB(157, 241, 241, 241),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 18.0, left: 18, right: 18, bottom: 5),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Date ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(": "),
                              Text(
                                servicedate.day.toString() +
                                    '/' +
                                    servicedate.month.toString() +
                                    '/' +
                                    servicedate.year.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Services ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(": "),
                          Text(
                            servicedesc,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(157, 158, 158, 158)),
                        ),
                        child: Text(servicedesc),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                deleteservice();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 1, right: 1, bottom: 2),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Remove',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(
                    top: 5, left: 5, right: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Please wait atleast two days to resolve the problems by Management.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
