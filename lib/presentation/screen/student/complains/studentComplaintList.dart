import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/modules/complaint_model.dart';
import 'package:provider/provider.dart';

class StudentComplaintListScreen extends StatelessWidget {
  const StudentComplaintListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<Complaint> complaintList = [];
    //  final data = context.watch<List<Complaint>>();
    final complaintListRaw = Provider.of<List<Complaint>?>(context);
    complaintListRaw?.forEach((element) {
      if (auth.currentUser?.uid == element.studentUid) {
        complaintList.add(element);
      }
      ;
    });

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Your Complaint'),
        ),
        body: complaintList != []
            ? ListView.builder(
                itemCount: complaintList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(complaintList[index].complaintTitle,
                                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17)),
                                Text(complaintList[index].time.day.toString() +
                                '/' +
                                complaintList[index].time.month.toString() +
                                '/' +
                                complaintList[index].time.year.toString(),
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                                ),
                                ],
                              ),
                              Spacer(),
                              complaintList[index].status
                                ? Text(
                                    'Approved',
                                    style: TextStyle(color: Colors.green),
                                  )
                                : Text('Pending',
                                    style: TextStyle(color: Colors.red)),
                                     SizedBox(
                            width: 5,
                          ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.black54,))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text( complaintList[index].complaint)
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
