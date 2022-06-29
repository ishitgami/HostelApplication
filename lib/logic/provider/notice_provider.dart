import 'package:flutter/cupertino.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/notice_firestore_service.dart';
import 'package:uuid/uuid.dart';

class NoticeProvider with ChangeNotifier {
   final service = NoticeFirestoreService();
  late String _id;
  late String _notice;
  late DateTime _time;
  var uuid = Uuid();

  // getter
  String get getNotice => _notice;
  DateTime get getTime => _time;

  //Setters:
  void changeNotice(String value) {
    _notice = value;
    notifyListeners();
  }

  void changetime(DateTime time) {
    _time = time;
    notifyListeners();
  }

  void saveNotice() {
    var newNotice = Notice(id: uuid.v4(), notice: getNotice, time: getTime);
    service.saveNotice(newNotice);
  }


} 