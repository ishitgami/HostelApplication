import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';

class UserDataFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(UserData userData) {
    return _db.collection('User').doc(userData.id).set(userData.createMap());
  }

  Stream<List<UserData>> getUserData() {
    return _db
        .collection('User')
        .orderBy("time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => UserData.fromFirestore(document.data()))
            .toList());
  }

   Future<void> removeUser(String userId) {
    return _db.collection('User').doc(userId).delete();
  }
}
