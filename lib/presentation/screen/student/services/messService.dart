import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/repairDeviceWidget.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/serviceTextField.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/userTable.dart';
import 'package:provider/provider.dart';

import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';

class StudentMessServices extends StatefulWidget {
  const StudentMessServices({Key? key}) : super(key: key);

  @override
  State<StudentMessServices> createState() => _StudentMessServicesState();
}

class _StudentMessServicesState extends State<StudentMessServices> {
  Map<String, bool> values = {};
  bool isMesstableChecked = false;
  bool isFanChecked = false;
  bool isOtherChecked = false;
  List repairDeviceList = [];
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    final userList = Provider.of<List<UserData>?>(context);
    Iterable<UserData>? userData =
        userList?.where((element) => user.uid == element.id);
    final serviceProvider = Provider.of<ServiceProvider>(context);
    DateTime now = DateTime.now();
    const tablepadding = EdgeInsets.all(15);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Electricity Service"),
      ),
      body: SingleChildScrollView(
        child: userData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    UserTable(
                        tablepadding: tablepadding,
                        userData: userData,
                        now: now),
                    RepairDeviceWidget(
                      isItem1Checked: isMesstableChecked,
                      isItem2Checked: isFanChecked,
                      isItem3Checked: isOtherChecked,
                      item1Img: "assets/images/messtable.png",
                      item2Img: "assets/images/fan.png",
                      item3Img: "assets/images/otherservice.png",
                      item1Name: "MessTable",
                      item2Name: "Fan          ",
                      item3Name: "Other      ",
                      item1Fun: (value) {
                        setState(() {
                          isMesstableChecked = value!;
                        });
                      },
                      item2Fun: (value) {
                        setState(() {
                          isFanChecked = value!;
                        });
                      },
                      item3Fun: (value) {
                        setState(() {
                          isOtherChecked = value!;
                        });
                      },
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 18, right: 18, bottom: 50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Service ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(":"),
                                  Row(
                                    children: [
                                      Text(
                                        isMesstableChecked ? 'Messtable,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isFanChecked ? 'Fan,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isOtherChecked ? 'Other,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ServiceTextField(onServiceDecChange: (value) {
                                serviceProvider.changeServiceDes(value);
                              }),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 22,
                        child: FloatingActionButton(
                            onPressed: () {
                              isMesstableChecked
                                  ? repairDeviceList.add('Messtable')
                                  : null;
                              isFanChecked ? repairDeviceList.add('Fan') : null;
                              isOtherChecked
                                  ? repairDeviceList.add('Other')
                                  : null;
                              serviceProvider.changeName(
                                  userData.first.firstName +
                                      ' ' +
                                      userData.first.lastName);
                              serviceProvider
                                  .changeRepairDeviceList(repairDeviceList);
                              serviceProvider
                                  .changeRoomNo(userData.first.roomNo);
                              serviceProvider.changeStudentUid(user.uid);
                              serviceProvider.changeServiceTitle('Mess');
                              serviceProvider.saveService();
                              repairDeviceList.clear();
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.done,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
                    ]),
                  ],
                ),
              ),
      ),
    );
  }
}
