import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';

class NoticeFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveNotice(Notice notice) {
    return _db.collection('Notice').doc(notice.id).set(notice.createMap());
  }

  Stream<List<Notice>> getNotice() {
    return _db.collection('Notice').orderBy("time", descending: true).snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Notice.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeNotice(String noticeId) {
    return _db.collection('Notice').doc(noticeId).delete();
  }
}
