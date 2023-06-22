// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    UserData? userData;
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    List<UserData> userDataList = [];
    final userprovider = Provider.of<UsereDataProvider>(context);
    final userDataListRaw = Provider.of<List<UserData>?>(context);
    userDataListRaw?.forEach((element) {
      if (user.uid == element.id) {
        userDataList.add(element);
      }
      ;
    });

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          pickedFile != null
              ? GestureDetector(
                  onTap: () async {
                    setState(() {
                      showLoading = true;
                    });
                    progressIndicater(context, showLoading = true);
                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('profileImg')
                        .child(pickedFile!.name.toString());
                    await ref.putFile(imageFile);
                    String url = await ref.getDownloadURL();
                    userprovider.changeUserimage(url);
                    userprovider.updateProfileImg(user.uid);
                    setState(() {
                      showLoading = false;
                      pickedFile = null;
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Center(
                        child: Text("Save", style: TextStyle(fontSize: 17))),
                  ))
              : const SizedBox(),
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
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                backgroundImage: pickedFile != null
                                    ? FileImage((File("${pickedFile!.path}")))
                                    : NetworkImage(userDataList.first.userimage)
                                        as ImageProvider,
                                radius: 70,
                              ),
                            ),
                            Positioned(
                              child: buildCircle(
                                  all: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      selectFile();
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.blue.shade900,
                                      size: 20,
                                    ),
                                  )),
                              right: 3,
                              top: 110,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userDataList.first.firstName +
                                ' ' +
                                userDataList.first.lastName,
                            style: TextStyle(
                                fontSize: 29, fontWeight: FontWeight.w600),
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
                              color: Color.fromARGB(183, 255, 255, 255),
                            ),
                            child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    'Room No',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    userDataList.first.roomNo,
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataCell(
                                    Text(userDataList.first.email),
                                  ),
                                ]),
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      'Phone No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataCell(
                                    Text(userDataList.first.mobileNo),
                                  ),
                                ]),
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        'Date of joining',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        userDataList.first.time.day.toString() +
                                            '/' +
                                            userDataList.first.time.month
                                                .toString() +
                                            '/' +
                                            userDataList.first.time.year
                                                .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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

  Future<dynamic>? progressIndicater(BuildContext context, showLoading) {
    if (showLoading == true) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    } else
      return null;
  }

  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
