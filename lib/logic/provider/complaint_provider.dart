import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/complaint_firestore_service.dart';
import 'package:uuid/uuid.dart';

class ComplaintProvider with ChangeNotifier {
  final service = ComplaintFirestoreService();
  late String _id;
  late String _complaint;
  late String _complaintTitle;
  late String _studenyUid;
  DateTime _time = DateTime.now();
  var uuid = Uuid();

  // getter
  String get getCommplaint => _complaint;
  String get getComplaintTitle => _complaintTitle;
  String get gerStudentUid => _studenyUid;

  // setter
  void changeComplaint(String value) {
    _complaint = value;
  }

  void changeComplaintTitle(String value) {
    _complaintTitle = value;
  }

  void changeStudentUid(String value) {
    _studenyUid = value;
  }

  void saveComplaint() {
    var newComplaint = Complaint(
        id: uuid.v4(),
        complaint: getCommplaint,
        complaintTitle: getComplaintTitle,
        time: _time,
        studentUid: gerStudentUid);
    service.saveComplaint(newComplaint);
  }

  void deleteComplaint(complaintId) {
    service.removeComplaint(complaintId);
  }
}
