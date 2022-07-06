import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/service_model.dart';

class ServiceFirestoreService {
    FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveService(Service service) {
    return _db.collection('Service').doc(service.id).set(service.createMap());
  }

   Stream<List<Service>> getService() {
    return _db
        .collection('Service')
        .orderBy("Time", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Service.fromFirestore(document.data()))
            .toList());
  }

  
   Future<void> removeService(String serviceId) {
    return _db.collection('Service').doc(serviceId).delete();
  }
  
  Future<void> changeServiceStatus(int status,String serviceId) {
    return _db.collection('Service').doc(serviceId).set({
      'Status' : status
    },
    SetOptions(
            merge: true,
          ),
    );
}




}