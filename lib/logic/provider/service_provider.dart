import 'package:flutter/foundation.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/service_firestore_service.dart';
import 'package:uuid/uuid.dart';

class ServiceProvider with ChangeNotifier {
  final service = ServiceFirestoreService();

  late String _serviceDes;
  late List _repairDeviceList;
  late String _name;
  late String _roomNo;
  late String _studentUid;
  late String _serviceTitle;
  DateTime _time = DateTime.now();
  var uuid = Uuid();


  // getter
  String get getServiceDes => _serviceDes;
  String get getRoomNo => _roomNo;
  List get getRepairDeviceList => _repairDeviceList;
  String get getName => _name;
  String get getStudentUid => _studentUid;
  String get getServiceTitle => _serviceTitle;


  // setter
  void changeServiceDes (String value) {
   _serviceDes = value;
  }

    void changeRoomNo (String value) {
  _roomNo  = value;
  }

    void changeName (String value) {
    _name= value;
  }

    void changeStudentUid (String value) {
   _studentUid = value;
  }

    void changeRepairDeviceList (List value) {
    _repairDeviceList= value;
  }

  void changeServiceTitle (String value) {
    _serviceTitle = value;
  }

  void saveService() {
    var newService = Service(
      id: uuid.v4(), 
      name: _name, 
      studentUid: _studentUid, 
      serviceDes: _serviceDes, 
      repairDeviceList: _repairDeviceList, 
      time: _time, 
      status: 0, 
      serviceTitle: _serviceTitle,
      roomNo: _roomNo);
      service.saveService(newService);
  }

  void deleteService(serviceId) {
    service.removeService(serviceId);
  }

  void changeStatus(status, serviceId) {
    service.changeServiceStatus(status, serviceId);
  }
}