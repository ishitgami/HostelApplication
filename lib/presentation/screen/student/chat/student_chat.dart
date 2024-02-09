import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/chat_model.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/provider/userData_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/chat_firestore_service.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class StudentChatScreen extends StatefulWidget {
  const StudentChatScreen({super.key});

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {
  TextEditingController _messageController = TextEditingController();

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
      bottomSheet: Form(
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
                backgroundImage: NetworkImage(userDataList.first.userimage),
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
                  ));
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
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
          } else {
            final chatData = snapshot.data;

            final chat = chatData?.map((e) {
              return ChatModel(
                id: e['Id'],
                name: e['Name'],
                message: e['Message'],
                time: e['Time'],
                avatarUrl: e['AvatarUrl'],
                date:
                    // timerstamp to date
                    DateTime.fromMillisecondsSinceEpoch(
                        e['Date'].seconds * 1000),
              );
            }).toList();
            return ListView.builder(
              itemCount: chat?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return chat![index].name ==
                        userDataList.first.firstName +
                            " " +
                            userDataList.first.lastName
                    ? SenderChatBubble(chat[index])
                    : ReceiverChatBubble(chat[index]);
              },
            );
          }
        },
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
}
