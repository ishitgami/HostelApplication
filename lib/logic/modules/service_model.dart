class Service {
  String id;
  String name;
  String studentUid;
  String serviceDes;
  List repairDeviceList;
  DateTime time;
  int status;
  String roomNo;
  Service({
    required this.id,
    required this.name,
    required this.studentUid,
    required this.serviceDes,
    required this.repairDeviceList,
    required this.time,
    required this.status,
    required this.roomNo,
  });

  Map<String,dynamic> createMap() {
    return {
      'id' :id,
      'Name' : name,
      'RoomNo' : roomNo,
      'StudentUid' :studentUid,
      'Time' :time,
      'Status' :status,
      'ServiceDes' :serviceDes,
      'RepairDeviceList' : repairDeviceList,
    };
  }

  Service.fromFirestore(Map<String,dynamic> firestoreMap) 
   : id = firestoreMap['id'],
      name = firestoreMap['Name'],
      roomNo = firestoreMap['RoomNo'],
      studentUid = firestoreMap['StudentUid'],
      time = firestoreMap['Time'],
      status = firestoreMap['Status'],
      serviceDes = firestoreMap['ServiceDes'],
      repairDeviceList = firestoreMap['RepairDeviceList'];
}
