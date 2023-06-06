class Notice {
  String id;
  String notice;
  DateTime time;
   String? url;
  Notice(
    this.url, {
    required this.id,
    required this.notice,
    required this.time,
  });

  Map<String, dynamic> createMap() {
    return {'Id': id, 'notice': notice, 'time': time, 'url': url};
  }

  Notice.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['Id'],
        notice = firestoreMap['notice'],
        time = firestoreMap['time'].toDate(),
        url = firestoreMap['url'];

  toList() {}
}
