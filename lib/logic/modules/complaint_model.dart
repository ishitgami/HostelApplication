class Complaint {
  String id;
  String complaint;
  String complaintTitle;
  DateTime time;
  String studentUid;
  Complaint({
    required this.id,
    required this.complaint,
    required this.complaintTitle,
    required this.time,
    required this.studentUid
  });

  Map<String,dynamic> createMap() {
    return {
      'id': id,
      'complaint' : complaint,
      'time' : time,
      'studentUid' : studentUid,
      'complaintTitle' : complaintTitle,
    };
  }

  Complaint.fromFirestore(Map<String, dynamic> firestoreMap) 
    : id = firestoreMap['id'],
    complaintTitle = firestoreMap['complaintTitle'],
    complaint = firestoreMap['complaint'],
    time = firestoreMap['time'].toDate(),
    studentUid = firestoreMap['studentUid'];
}