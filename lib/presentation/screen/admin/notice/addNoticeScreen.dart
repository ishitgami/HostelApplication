import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class AddNoticeScreen extends StatefulWidget {
  AddNoticeScreen({Key? key}) : super(key: key);

  @override
  State<AddNoticeScreen> createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  late File imageFile;
  PlatformFile? pickedFile;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    final noticeProvider = Provider.of<NoticeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notice'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 18.0, left: 18, right: 18, bottom: 50),
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
                          const Text(
                            "NOTICE ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0, left: 18, right: 18, bottom: 10),
                            child: TextFormField(
                              onChanged: ((value) =>
                                  noticeProvider.changeNotice(value)),
                              controller: noticeController,
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText:
                                      "Type notice/instruction here...... 🖍",
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                              maxLines: 8,
                              keyboardType: TextInputType.multiline,
                              maxLength: 1000,
                              cursorColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 20),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  selectFile();
                                },
                                child: Text(
                                  "Add Attachment",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          pickedFile != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.all(5),
                                  color: Colors.blue[100],
                                  child: Text(
                                    "${pickedFile!.name}",
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 20,
                    child: FloatingActionButton(
                      onPressed: () async {
                        setState(() {
                          showLoading = true;
                        });
                        progressIndicater(context, showLoading = true);
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('noticeImg')
                            .child(pickedFile!.name.toString());
                        await ref.putFile(imageFile);
                        String url = await ref.getDownloadURL();
                        noticeProvider.changeUrl(url);
                        noticeProvider.changetime(DateTime.now());
                        noticeProvider.saveNotice();
                        noticeController.clear();
                        setState(() {
                          showLoading = false;
                        });
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
}
