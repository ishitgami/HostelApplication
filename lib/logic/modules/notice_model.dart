import 'package:cloud_firestore/cloud_firestore.dart';

class Notice {
  String id;
  String notice;
  DateTime time;
  Notice({
    required this.id,
    required this.notice,
    required this.time,
  });

  Map<String, dynamic> createMap() {
    return {'Id': id, 'notice': notice, 'time': time};
  }

 

  Notice.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['Id'],
        notice = firestoreMap['notice'],
        time = firestoreMap['time'];

  toList() {}

 
}
