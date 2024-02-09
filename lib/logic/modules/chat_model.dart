class ChatModel {
  String id;
  String name;
  String message;
  String time;
  String avatarUrl;
  DateTime date;

  ChatModel({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.date,
  });

  Map<String, dynamic> createMap() {
    return {
      'Id': id,
      'Name': name,
      'Message': message,
      'Time': time,
      'AvatarUrl': avatarUrl,
      'Date': date,
    };
  }

  ChatModel.fromFirestore(Map<String, dynamic> firestoreMap)
      : id = firestoreMap['Id'],
        name = firestoreMap['Name'],
        message = firestoreMap['Message'],
        time = firestoreMap['Time'],
        avatarUrl = firestoreMap['AvatarUrl'],
        date = firestoreMap['Date'].toDate();

  ChatModel.fromMap(Map<String, dynamic> map)
      : id = map['Id'],
        name = map['Name'],
        message = map['Message'],
        time = map['Time'],
        avatarUrl = map['AvatarUrl'],
        date = map['Date'];
}
