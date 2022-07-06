import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/repairDeviceWidget.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/serviceTextField.dart';
import 'package:hostelapplication/presentation/screen/student/services/widget/userTable.dart';
import 'package:provider/provider.dart';

import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';

class StudentOtherServices extends StatefulWidget {
  const StudentOtherServices({Key? key}) : super(key: key);

  @override
  State<StudentOtherServices> createState() => _StudentOtherServicesState();
}

class _StudentOtherServicesState extends State<StudentOtherServices> {
  Map<String, bool> values = {};
  bool isOther1Checked = false;
  bool isOther2Checked = false;
  bool isOther3Checked = false;
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
                      isItem1Checked: isOther1Checked,
                      isItem2Checked: isOther2Checked,
                      isItem3Checked: isOther3Checked,
                      item1Img: "assets/images/otherservice.png",
                      item2Img: "assets/images/otherservice.png",
                      item3Img: "assets/images/otherservice.png",
                      item1Name: "Other1",
                      item2Name: "Other2",
                      item3Name: "Other3",
                      item1Fun: (value) {
                        setState(() {
                          isOther1Checked = value!;
                        });
                      },
                      item2Fun: (value) {
                        setState(() {
                          isOther2Checked = value!;
                        });
                      },
                      item3Fun: (value) {
                        setState(() {
                          isOther3Checked = value!;
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
                                        isOther1Checked ? 'Other 1,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isOther2Checked ? 'Other 2,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isOther3Checked ? 'Other 3,' : '',
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
                              isOther1Checked
                                  ? repairDeviceList.add('Other1')
                                  : null;
                              isOther2Checked
                                  ? repairDeviceList.add('Other2')
                                  : null;
                              isOther3Checked
                                  ? repairDeviceList.add('Other3')
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
                              serviceProvider.changeServiceTitle('Other');
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
