class UserData {
  String id;
  String firstName;
  String lastName;
  String roomNo;
  String email;
  DateTime time;
  UserData({
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.roomNo,
    required this.time
  });

  Map<String,dynamic> createMap() {
    return {
     'id' : id,
      'FirstName' : firstName,
      'Lastname' : lastName,
      'RoomNo' : roomNo,
      'Email' : email,
      'time' : time,
    };
  }

  UserData.fromFirestore(Map<String,dynamic> firestoreMap) 
  : id = firestoreMap['id'],
  firstName = firestoreMap['FirstName'],
  lastName = firestoreMap['LastName'],
  email = firestoreMap['Email'],
  roomNo = firestoreMap['RoomNo'],
  time = firestoreMap['time'].toDate();
}