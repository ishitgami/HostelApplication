import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostelapplication/core/constant/textController.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'package:image_picker/image_picker.dart';
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
  //  late File imageFile1;

  String? _fileName;
  List<PlatformFile>? _paths;

  String? _extension;
  var img;

  FileType _pickingType = FileType.any;
  FileType _PickingImage = FileType.image;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

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
            Stack(children: [
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
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: "Type notice/instruction here...... 🖍",
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
                        padding: const EdgeInsets.only(left: 18.0, right: 20),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              selectFile();
                              // showModalBottomSheet<void>(
                              //   backgroundColor: Colors.transparent,
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.white,
                              //           borderRadius: BorderRadius.only(
                              //               topLeft: Radius.circular(20),
                              //               topRight: Radius.circular(20))),
                              //       height: 150,
                              //       child: Center(
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           mainAxisSize: MainAxisSize.min,
                              //           children: <Widget>[
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.spaceAround,
                              //               children: [
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     setState(() {
                              //                       _openFileExplorer();
                              //                     });
                              //                   },
                              //                   child: attachmenticon(
                              //                       Icons.insert_drive_file,
                              //                       Colors.indigo,
                              //                       "Document"),
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     setState(() {
                              //                       _getFromCamera();
                              //                     });
                              //                   },
                              //                   child: attachmenticon(
                              //                       Icons.camera_alt,
                              //                       Colors.pink,
                              //                       "Camera"),
                              //                 ),
                              //                 GestureDetector(
                              //                   onTap: () {
                              //                     setState(() {
                              //                       _openImagePicker();
                              //                     });
                              //                   },
                              //                   child: attachmenticon(
                              //                       Icons.insert_photo,
                              //                       Colors.purple,
                              //                       "Gallery"),
                              //                 )
                              //               ],
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );
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
        )),
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

// //Get From File
//   void _openFileExplorer() async {
//     try {
//       setState(() async {
//         _paths = (await FilePicker.platform.pickFiles(
//           type: _pickingType,
//         ))
//             ?.files;
//       });

//       setState(() {
//         img = _paths?.map((e) => e.name);
//       });
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     } catch (ex) {
//       print(ex);
//     }
//   }

//   //Get From Gallery
//   void _openImagePicker() async {
//     try {
//       setState(() async {
//         _paths = (await FilePicker.platform.pickFiles(
//           type: _PickingImage,
//         ))
//             ?.files;
//       });
//     } on PlatformException catch (e) {
//       print("Unsupported operation" + e.toString());
//     } catch (ex) {
//       print(ex);
//     }
//   }

//   /// Get from Camera
//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//         String fileName = imageFile.path.split('/').last;
//       });
//     }
//   }
}

Widget attachmenticon(IconData icon, Color color, String str) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        child: Icon(
          icon,
          size: 29,
          color: Colors.white,
        ),
        backgroundColor: color,
      ),
      Text(str)
    ],
  );
}
