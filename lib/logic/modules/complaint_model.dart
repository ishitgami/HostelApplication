class Complaint {
  String id;
  String complaint;
  String complaintTitle;
  DateTime time;
  String studentUid;
  String name;
  String roomNo;
  int status;
  Complaint({
    required this.id,
    required this.complaint,
    required this.complaintTitle,
    required this.time,
    required this.studentUid,
    required this.name,
    required this.roomNo,
    required this.status,
  });

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'Complaint': complaint,
      'Time': time,
      'StudentUid': studentUid,
      'ComplaintTitle': complaintTitle,
      'Name': name,
      'RoomNo': roomNo,
      'Status': status,
    };
  }

  Complaint.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['id'],
        complaintTitle = firestoreMap['ComplaintTitle'],
        complaint = firestoreMap['Complaint'],
        time = firestoreMap['Time'].toDate(),
        studentUid = firestoreMap['StudentUid'],
        roomNo = firestoreMap['RoomNo'],
        status = firestoreMap['Status'],
        name = firestoreMap['Name'];
}
