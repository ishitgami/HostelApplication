class Leave {
  String id;
  String name;
  String studentId;
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
    required this.studentId,
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
      'StudentId': studentId,
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
        studentId = firestoreMap['StudentId'],
        leaveReason = firestoreMap['LeaveReason'],
        roomNo = firestoreMap['RoomNo'],
        dateOfLeave = firestoreMap['DateOfLeaving'].toDate(),
        dateOfComing = firestoreMap['DateOfComing'].toDate(),
        leaveApplyDate = firestoreMap['LeaveApplyDate'].toDate(),
        status = firestoreMap['Status'],
        totalDay = firestoreMap['TotalDay'];
}
