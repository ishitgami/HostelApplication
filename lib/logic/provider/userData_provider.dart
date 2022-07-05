import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/userData_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/user_firestore_services.dart';

class UsereDataProvider with ChangeNotifier {
  final service = UserDataFirestoreService();
  late String _id;
  late String _firstName;
  late String _lastName;
  late String _roomNo;
  late String _email;
  late String _mobileNo;
   String _userimage = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  DateTime _time = DateTime.now();

  // getter
  String get getId => _id;
  String get getFirstName => _firstName;
  String get getLastName => _lastName;
  String get getRoomNo => _roomNo;
  String get getEmail => _email;
  String get getUserimage => _userimage;
  String get getEnrollment => _mobileNo;

  // setter
  void changeId(String value) {
    _id = value;
  }

  void changeFirstName(String value) {
    _firstName = value;
  }

  void changeLastName(String value) {
    _lastName = value;
  }

  void changeRoomNo(String value) {
    _roomNo = value;
  }

  void changeEmail(String value) {
    _email = value;
  }

  void changeMobileNo(String value) {
    _mobileNo = value;
  }

  void changeUserimage(String value) {
    _userimage = value;
  }

  void saveUserData() {
    var newUserData = UserData(
        email: getEmail,
        firstName: getFirstName,
        id: getId,
        lastName: getLastName,
        roomNo: getRoomNo,
        mobileNo: getEnrollment,
        userimage: getUserimage.isEmpty ? '' :getUserimage ,
        time: _time);
    service.saveUser(newUserData);
  }

  void deleteUserData(userId) {
    service.removeUser(userId);
  }

  void updateProfileImg(studentntID) {
    service.upadateProfileImg(_userimage, studentntID);
  }
}
