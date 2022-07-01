import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';

class ComplaintFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveComplaint(Complaint complaint) {
    return _db
        .collection('Complaint')
        .doc(complaint.id)
        .set(complaint.createMap());
  }

  Stream<List<Complaint>> getComplaintForStudent(complaintId) {
    return _db
        .collection('Complaint')
        .where('studentUid', isEqualTo: complaintId)
        .orderBy("time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Complaint.fromFirestore(document.data()))
            .toList());
  }

  Stream<List<Complaint>> getComplaintForAdmin() {
    return _db
        .collection('Complaint')
        .orderBy("time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Complaint.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeComplaint(String complaintId) {
    return _db.collection('Complaint').doc(complaintId).delete();
  }
}
