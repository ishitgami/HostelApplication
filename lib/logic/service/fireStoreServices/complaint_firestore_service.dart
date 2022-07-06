import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';

class ComplaintFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveComplaint(Complaint complaint) {
    return _db
        .collection('Complaint')
        .doc(complaint.id)
        .set(complaint.createMap());
  }

  Stream<List<Complaint>> getComplaintForStudent() {
    return _db
        .collection('Complaint')
        .where('StudentUid', isEqualTo: auth.currentUser?.uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Complaint.fromFirestore(document.data()))
            .toList());
  }

  Stream<List<Complaint>> getComplaintForAdmin() {
    return _db
        .collection('Complaint')
        .orderBy("Time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Complaint.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeComplaint(String complaintId) {
    return _db.collection('Complaint').doc(complaintId).delete();
  }

  Future<void> changeComplaintStatus(int status,String compaintId) {
    return _db.collection('Complaint').doc(compaintId).set({
      'Status' : status
    },
    SetOptions(
            merge: true,
          ),
    );
  }
}
