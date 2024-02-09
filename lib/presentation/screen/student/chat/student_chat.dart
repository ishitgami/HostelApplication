import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/chat_model.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/chat_firestore_service.dart';
import 'package:hostelapplication/presentation/screen/Widgets/full_screen_view.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class StudentChatScreen extends StatefulWidget {
  const StudentChatScreen({super.key});

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen>
    with WidgetsBindingObserver {
  TextEditingController _messageController = TextEditingController();
  ScrollController? _scrollController;

  bool showLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        showLoading = false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    User user = authService.getcurrentUser();
    List<UserData> userDataList = [];
    final userDataListRaw = Provider.of<List<UserData>?>(context);
    userDataListRaw?.forEach((element) {
      if (user.uid == element.id) {
        userDataList.add(element);
      }
      ;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Chat',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Brazila",
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const StudentDrawer(),
      bottomSheet: showLoading
          ? CircularProgressIndicator()
          : Form(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // user image here
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(userDataList.first.userimage),
                    ),

                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // add attachment

                        selectFile().then((value) async {
                          final ref = FirebaseStorage.instance
                              .ref()
                              .child('chat_attachment')
                              .child(value.path!);
                          await ref.putFile(File(value.path!));
                          String url = await ref.getDownloadURL();
                          ChatFirestoreService().saveChat(ChatModel(
                            id: Uuid().v4(),
                            name: userDataList.first.firstName +
                                " " +
                                userDataList.first.lastName,
                            message: "",
                            time: DateTime.now().toString(),
                            avatarUrl: userDataList.first.userimage,
                            date: DateTime.now(),
                            attachment: url,
                          ));

                          _messageController.clear();
                          _scrollController?.animateTo(
                            _scrollController!.position.maxScrollExtent + 100,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        });
                      },
                      child: Icon(Icons.attach_file),
                    ),

                    IconButton(
                      onPressed: () {
                        ChatFirestoreService().saveChat(ChatModel(
                          id: Uuid().v4(),
                          name: userDataList.first.firstName +
                              " " +
                              userDataList.first.lastName,
                          message: _messageController.text,
                          time: DateTime.now().toString(),
                          avatarUrl: userDataList.first.userimage,
                          date: DateTime.now(),
                          attachment: "",
                        ));
                        _messageController.clear();
                        _scrollController?.animateTo(
                          _scrollController!.position.maxScrollExtent + 100,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: StreamBuilder(
          stream: ChatFirestoreService().getChat(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error occured'),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No chat available'),
              );
            } else {
              final chatData = snapshot.data;

              final chat = chatData
                  ?.map((e) {
                    return ChatModel(
                      id: e['Id'] ?? "",
                      name: e['Name'] ?? "",
                      message: e['Message'] ?? "",
                      time: e['Time'] ?? "",
                      avatarUrl: e['AvatarUrl'] ?? "",
                      attachment: e['attachment'] ?? "",
                      date: e['Date'] == null
                          ? DateTime.now()
                          :
                          // timerstamp to date
                          DateTime.fromMillisecondsSinceEpoch(
                              (e['Date']).seconds * 1000,
                            ),
                    );
                  })
                  .toList()
                  .reversed
                  .toList();

              return Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: chat?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return chat![index].name ==
                              userDataList.first.firstName +
                                  " " +
                                  userDataList.first.lastName
                          ? chat[index].attachment.isNotEmpty
                              ? SenderAttachment(chat[index])
                              : SenderChatBubble(chat[index])
                          : chat[index].attachment.isNotEmpty
                              ? ReceiverAttachment(chat[index])
                              : ReceiverChatBubble(chat[index]);
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget SenderChatBubble(ChatModel chat) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat.message,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('hh:mm a').format(chat.date),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),

          // image
          CircleAvatar(
            backgroundImage: NetworkImage(chat.avatarUrl),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget ReceiverChatBubble(ChatModel chat) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(width: 10),
          // image
          CircleAvatar(
            backgroundImage: NetworkImage(chat.avatarUrl),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.message,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('hh:mm a').format(chat.date),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<PlatformFile> selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: [
        // only image
        'jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'
      ],
      type: FileType.custom,
    );
    if (result != null) {
      return result.files.first;
    } else {
      return PlatformFile(
        name: "",
        size: 0,
        path: "",
      );
    }
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

  // sender attachment

  Widget SenderAttachment(ChatModel chat) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageView(
                        imageurl: chat.attachment,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(chat.attachment),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  DateFormat('hh:mm a').format(chat.date),
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  // receiver attachment
  Widget ReceiverAttachment(ChatModel chat) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullImageView(
                        imageurl: chat.attachment,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(chat.attachment),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  DateFormat('hh:mm a').format(chat.date),
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
