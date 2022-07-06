import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/repairDeviceWidget.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/serviceTextField.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/userTable.dart';
import 'package:provider/provider.dart';

import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';

class StudentBathroomServices extends StatefulWidget {
  const StudentBathroomServices({Key? key}) : super(key: key);

  @override
  State<StudentBathroomServices> createState() =>
      _StudentBathroomServicesState();
}

class _StudentBathroomServicesState extends State<StudentBathroomServices> {
  Map<String, bool> values = {};
  bool isShowerChecked = false;
  bool isMirrorChecked = false;
  bool isWaterleakChecked = false;
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
                      isItem1Checked: isShowerChecked,
                      isItem2Checked: isMirrorChecked,
                      isItem3Checked: isWaterleakChecked,
                      item1Img: "assets/images/shower.png",
                      item2Img: "assets/images/mirror.png",
                      item3Img: "assets/images/leak.png",
                      item1Name: "Shower      ",
                      item2Name: "Mirror       ",
                      item3Name: "waterleak",
                      item1Fun: (value) {
                        setState(() {
                          isShowerChecked = value!;
                        });
                      },
                      item2Fun: (value) {
                        setState(() {
                          isMirrorChecked = value!;
                        });
                      },
                      item3Fun: (value) {
                        setState(() {
                          isWaterleakChecked = value!;
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
                                        isShowerChecked ? 'Shower,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isMirrorChecked ? 'Mirror,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isWaterleakChecked ? 'Water leak,' : '',
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
                              isShowerChecked
                                  ? repairDeviceList.add('Shower')
                                  : null;
                              isMirrorChecked
                                  ? repairDeviceList.add('Mirror')
                                  : null;
                              isWaterleakChecked
                                  ? repairDeviceList.add('Waterleak')
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
                              serviceProvider.changeServiceTitle('Bathroom');
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
