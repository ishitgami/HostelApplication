import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../../../../logic/modules/userData_model.dart';
import '../../../../logic/provider/complaint_provider.dart';

class Mycomplaints extends StatefulWidget {
  const Mycomplaints({Key? key}) : super(key: key);

  @override
  State<Mycomplaints> createState() => _MycomplaintsState();
}

class _MycomplaintsState extends State<Mycomplaints> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('Complaint').snapshots();

    final complaintlist = Provider.of<List<Complaint>?>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("My complaints"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return
                  // complaintlist != null
                  //     ?
                  // ListView.builder(
                  //     itemCount: complaintlist.length,
                  //     itemBuilder: (context, index) {
                  //       return MycomplaintsListModel(
                  //           "${complaintlist[index].time} ",
                  //           complaintlist[index].complaintTitle,
                  //           complaintlist[index].complaint);
                  //     })

                  ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                final Timestamp timestamp = data["Time"] as Timestamp;
                final DateTime dateTime = timestamp.toDate();
                final dateString = DateFormat.yMMMEd().format(dateTime);

                final Studentid = data["StudentUid"];

                return MycomplaintsListModel(
                    dateString, data["ComplaintTitle"], data["Complaint"]);
              }).toList());
              // : Center(
              //     child: CircularProgressIndicator(),
              //   );
            }));
  }
}

class MycomplaintsListModel extends StatelessWidget {
  MycomplaintsListModel(
      this.Complaintdate, this.Complainttype, this.Compiantdesc,
      {Key? key})
      : super(key: key);
  String Complaintdate;
  String Complainttype;
  String Compiantdesc;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color.fromARGB(157, 241, 241, 241),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, left: 18, right: 18, bottom: 5),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Date ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(":"),
                            Text(
                              " $Complaintdate",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Complaint ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(":"),
                        Text(
                          " $Complainttype",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(157, 158, 158, 158)),
                      ),
                      child: Text('$Compiantdesc'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 1, right: 1, bottom: 2),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Remove',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding:
                  const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Please wait atleast two days to resolve the problems by Management.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
