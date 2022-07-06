import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';

class LeaveFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveLeave(Leave leave) {
    return _db.collection('Leave').doc(leave.id).set(leave.createMap());
  }

  Stream<List<Leave>> getLeave() {
    return _db
        .collection('Leave')
        .orderBy("LeaveApplyDate", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Leave.fromFirestore(document.data()))
            .toList());
  }

   Future<void> removeLeave(String leaveId) {
    return _db.collection('Leave').doc(leaveId).delete();
  }

  Future<void> changeLeaveStatus(int status,String leaveId) {
    return _db.collection('Leave').doc(leaveId).set({
      'Status' : status
    },
    SetOptions(
            merge: true,
          ),
    );
  }

}
