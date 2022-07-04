class Leave {
  String id;
  String name;
  String studentUid;
  String leaveReason;
  String roomNo;
  DateTime dateOfLeave;
  DateTime dateOfComing;
  DateTime leaveApplyDate;
  int totalDay;
  int status;
  Leave({
    required this.id,
    required this.name,
    required this.studentUid,
    required this.leaveReason,
    required this.roomNo,
    required this.leaveApplyDate,
    required this.dateOfLeave,
    required this.dateOfComing,
    required this.totalDay,
    required this.status,
  });

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'Name': name,
      'LeaveReason': leaveReason,
      'RoomNo': roomNo,
      'StudentUid': studentUid,
      'DateOfLeaving': dateOfLeave,
      'DateOfComing': dateOfComing,
      'Status': status,
      'TotalDay': totalDay,
      'LeaveApplyDate': leaveApplyDate,
    };
  }

  Leave.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['id'],
        name = firestoreMap['Name'],
        studentUid = firestoreMap['StudentUid'],
        leaveReason = firestoreMap['LeaveReason'],
        roomNo = firestoreMap['RoomNo'],
        dateOfLeave = firestoreMap['DateOfLeaving'].toDate(),
        dateOfComing = firestoreMap['DateOfComing'].toDate(),
        leaveApplyDate = firestoreMap['LeaveApplyDate'].toDate(),
        status = firestoreMap['Status'],
        totalDay = firestoreMap['TotalDay'];
}
