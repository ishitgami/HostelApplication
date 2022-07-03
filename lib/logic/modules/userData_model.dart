class UserData {
  String id;
  String firstName;
  String lastName;
  String roomNo;
  String email;
  String mobileNo;
  String userimage;
  DateTime time;
  UserData(
      {required this.email,
      required this.firstName,
      required this.id,
      required this.lastName,
      required this.roomNo,
      required this.mobileNo,
      required this.userimage,
      required this.time});

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'FirstName': firstName,
      'Lastname': lastName,
      'RoomNo': roomNo,
      'Email': email,
      'MobileNo': mobileNo,
      'UserImage': userimage,
      'time': time,
    };
  }

  UserData.fromFirestore(Map<String, dynamic>? firestoreMap)
      : id = firestoreMap!['id'],
        firstName = firestoreMap['FirstName'],
        lastName = firestoreMap['Lastname'],
        email = firestoreMap['Email'],
        roomNo = firestoreMap['RoomNo'],
        mobileNo = firestoreMap['MobileNo'],
        userimage = firestoreMap['UserImage'],
        time = firestoreMap['time'].toDate();
}
