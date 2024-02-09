import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/chat_model.dart';

class ChatFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveChat(ChatModel chat) {
    return _db.collection('Chat').doc(chat.id.toString()).set(chat.createMap());
  }

  Stream<List<Map<String, dynamic>>> getChat() {
    return _db
        .collection('Chat')
        .orderBy("Date", descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((document) => document.data()).toList());
  }


}
