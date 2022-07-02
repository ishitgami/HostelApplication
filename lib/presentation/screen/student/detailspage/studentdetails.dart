import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/userData_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({Key? key}) : super(key: key);

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  late File imageFile;
  PlatformFile? pickedFile;
  @override
  Widget build(BuildContext context) {
    // late AuthService authService;
    // authService = Provider.of<AuthService>(context);
    // final userList = Provider.of<List<UserData>?>(context);
    // final userprovider = Provider.of<UsereDataProvider>(context);
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // User? user = auth.currentUser;
    // String studentid = user!.uid;
    // Iterable<UserData>? userData =
    //     userList?.where((element) => studentid == element.id);

    // String studentname =
    //     userData!.first.firstName + ' ' + userData.first.lastName;
    // String imageurl = "url here";
    // String studentenroll = userData.first.enrollment;
    // String roomno = userData.first.roomNo;
    String studentname = "";
    String imageurl = "";
    String studentenroll = "";
    String roomno = "";
    String phonenumber =
        // userData.first.roomNo
        "9991001999";
    String department = "CSE";
    // userData.first.roomNo;
    String joiningdate = "01/01/2022";
    // userData.first.roomNo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          GestureDetector(
              onTap: () {
                // userprovider.changeUserimage("${pickedFile!.path}");
                // Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child:
                    Center(child: Text("Save", style: TextStyle(fontSize: 17))),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        // onTap: selectFile,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/image/profile_image.jpg")
                                // pickedFile == null
                                //     ? Image.network("${userData.first.userimage}")
                                //         as ImageProvider
                                //     : Image.asset("${pickedFile!.path!}")
                                //         as ImageProvider,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "   $studentname ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "   ($studentenroll)",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(183, 235, 237, 237),
                            ),
                            child: DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Hostel',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                DataColumn(
                                    label: Text(
                                  ': Abdul Kalam illam',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                )),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Room No')),
                                  DataCell(Text(':$roomno')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Department')),
                                  DataCell(Text(': $department')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Phone No')),
                                  DataCell(Text(': $phonenumber')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Date of joining')),
                                  DataCell(Text(': $joiningdate')),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ])),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;

      if (pickedFile != null) {
        imageFile = File(pickedFile!.path!);
      }
    });
  }
}
