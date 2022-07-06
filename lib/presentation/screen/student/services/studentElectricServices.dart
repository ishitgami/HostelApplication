import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/service_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentElectricityServices extends StatefulWidget {
  const StudentElectricityServices({Key? key}) : super(key: key);

  @override
  State<StudentElectricityServices> createState() =>
      _StudentElectricityServicesState();
}

class _StudentElectricityServicesState
    extends State<StudentElectricityServices> {
  Map<String, bool> values = {};
  bool isLightChecked = false;
  bool isFanChecked = false;
  bool isPlugChecked = false;
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
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(183, 235, 237, 237),
                          ),
                          child: Table(
                            // defaultColumnWidth: FixedColumnWidth(120.0),
                            columnWidths: const {
                              0: FixedColumnWidth(120),
                              1: FlexColumnWidth(),
                            },
                            border: TableBorder.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: const [
                                    Center(
                                      child: Text(
                                        'Name',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )
                                  ]),
                                ),
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: [
                                    Text(
                                      userData.first.firstName +
                                          ' ' +
                                          userData.first.lastName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )
                                  ]),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: const [
                                    Text(
                                      'Room No.',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ]),
                                ),
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: [
                                    Text(
                                      userData.first.roomNo,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )
                                  ]),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: const [
                                    Text(
                                      'Date',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ]),
                                ),
                                Padding(
                                  padding: tablepadding,
                                  child: Column(children: [
                                    Text(
                                      DateTime(now.year, now.month, now.day)
                                          .toString()
                                          .replaceAll("00:00:00.000", ""),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )
                                  ]),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, left: 18, right: 18),
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/light.png"),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("Light"),
                                      ],
                                    ),
                                    Checkbox(
                                        value: isLightChecked,
                                        onChanged: (bool? value) {
                                          // This is where we update the state when the checkbox is tapped
                                          setState(() {
                                            isLightChecked = value!;
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/plug.png"),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("Plug"),
                                      ],
                                    ),
                                    Checkbox(
                                        value: isPlugChecked,
                                        onChanged: (bool? value) {
                                          // This is where we update the state when the checkbox is tapped
                                          setState(() {
                                            isPlugChecked = value!;
                                          });
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/fan.png"),
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("Fan"),
                                      ],
                                    ),
                                    Checkbox(
                                        value: isFanChecked,
                                        onChanged: (bool? value) {
                                          // This is where we update the state when the checkbox is tapped
                                          setState(() {
                                            isFanChecked = value!;
                                          });
                                        })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 10),
                                child: Text(
                                  "Select the repaire devices",
                                  style: TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                        isLightChecked ? 'Light,' : '',
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
                                        isPlugChecked ? 'Plug,' : '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextFormField(
                                  onChanged: ((value)=> serviceProvider.changeServiceDes(value)),
                                  decoration: InputDecoration(
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText:
                                          "Type about repair devices here...... 🖍",
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 1000,
                                  cursorColor: Colors.black,
                                ),
                              ),
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
                              isPlugChecked
                                  ? repairDeviceList.add('Plug')
                                  : null;
                              isFanChecked ? repairDeviceList.add('Fan') : null;
                              isLightChecked
                                  ? repairDeviceList.add('Light')
                                  : null;
                              serviceProvider.changeName(
                                  userData.first.firstName +
                                      ' ' +
                                      userData.first.lastName);
                                serviceProvider.changeRepairDeviceList(repairDeviceList);
                                serviceProvider.changeRoomNo(userData.first.roomNo);
                                serviceProvider.changeStudentUid(user.uid);
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
