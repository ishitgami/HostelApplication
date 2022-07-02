import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/complaint_firestore_service.dart';
import 'package:uuid/uuid.dart';

class ComplaintProvider with ChangeNotifier {
  final service = ComplaintFirestoreService();
  late String _complaint;
  late String _complaintTitle;
  late String _studentUid;
  late String _roomNo;
  late String _name;
  DateTime _time = DateTime.now();
  var uuid = Uuid();

  // getter
  String get getCommplaint => _complaint;
  String get getComplaintTitle => _complaintTitle;
  String get gerStudentUid => _studentUid;
  String get gerRoomNo => _roomNo;
  String get gerName => _name;

  // setter
  void changeComplaint(String value) {
    _complaint = value;
  }

  void changeComplaintTitle(String value) {
    _complaintTitle = value;
  }

  void changeStudentUid(String value) {
    _studentUid = value;
  }

   void changeRoomNo(String value) {
    _roomNo = value;
  }

   void changeName(String value) {
    _name = value;
  }

  void saveComplaint() {
    var newComplaint = Complaint(
        id: uuid.v4(),
        complaint: getCommplaint,
        complaintTitle: getComplaintTitle,
        time: _time,
        name: gerName,
        roomNo: gerRoomNo,
        status: 0,
        studentUid: gerStudentUid);
    service.saveComplaint(newComplaint);
  }

  void deleteComplaint(complaintId) {
    service.removeComplaint(complaintId);
  }

  void changeStatus(status,compaintId) {
    service.changeComplaintStatus(status,compaintId);
  }
}
