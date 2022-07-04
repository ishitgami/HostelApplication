import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/leave_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/leave_firestore_service.dart';
import 'package:uuid/uuid.dart';

class LeaveProvider with ChangeNotifier {
  final service = LeaveFirestoreService();
  late String _leaveReason;
  late String _name;
  late String _roomNo;
  late String _studentUid;
  late int _totalDay;
  late DateTime _leavingDate;
  late DateTime _comingDate;
  DateTime _time = DateTime.now();
  var uuid = Uuid();

  // getter
  String get getLeaveReson => _leaveReason;
  String get getRoomNo => _roomNo;
  String get getName => _name;
  String get getStudentUid => _studentUid;
  int get getTotalDay => _totalDay;
  DateTime get getLeavingDate => _leavingDate;
  DateTime get getComingDate => _comingDate;

  // setter
  void changeLeaveReason(String value) {
    _leaveReason = value;
  }

  void changeRoomNo(String value) {
    _roomNo = value;
  }

  void changeName(String value) {
    _name = value;
  }

  void changeStudentUid(String value) {
    _studentUid = value;
  }

  void changeLeavingDate(DateTime value) {
    _leavingDate = value;
  }

  void changeComingDate(DateTime value) {
    _comingDate = value;
  }

  void changeTotalDay(int value) {
    _totalDay = value;
  }

  void saveLeave() {
    var newLeave = Leave(
      id: uuid.v4(),
      name: _name,
      studentUid: _studentUid,
      leaveReason: _leaveReason,
      roomNo: _roomNo,
      leaveApplyDate: _time,
      dateOfLeave: _leavingDate,
      dateOfComing: _comingDate,
      totalDay: _totalDay,
      status: 0,
    );
    service.saveLeave(newLeave);
  }

  void deleteLeave(leaveId) {
    service.removeLeave(leaveId);
  }

  void chageStatus(status, leaveId) {
    service.changeLeaveStatus(status, leaveId);
  }
}
