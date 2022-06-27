import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      drawer: const StudentDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NoticeContainer(
                  'All New Admitted Hostel Student of BE - 2 nd and 3 rd Year are informed to bring their latest GTU grade history print out in addition to other Documents mentioned in previous notice.'),
              NoticeContainer(
                  'Is stated that I have taken admission in your respective university. I belong from another city and that is very far from the university. It would not be possible for me to afford the transportation of every day and it is quite a lot haste.'),
              NoticeContainer(
                  'Letters should be addressed to the Superintendent of Hostels. In case of official letters, these should be routed through the Head of the Department or the Registrar (in the case of Undergraduates and Trainees) or the Principal College of Nursing (for students of Nursing). Letters should be handed over to the Hostel Office (in the Gents Hostels) and a receipt obtained if delivered by hand.'),
              NoticeContainer(
                  '1. Application for admission to hostel shall be made in the prescribed form which can be had from the Hostel Office. 2. Allotement of rooms shall be made by the Deputy Wardens under the orders of Warden.'),
              NoticeContainer(
                  '2.  In this Act  unless the context otherwise requires, Ragging means display of  noisy disorderly conduct doing any act which causes or is likely to cause physical or psychological harm or raise apprehension  or fear or shame or  embarrassment to a student in any educational institution and includes,'),
            ],
          ),
        ),
      ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, {Key? key}) : super(key: key);
  String notice;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Student',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text('01/07/2022', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(notice)
          ],
        ),
      ),
    );
  }
}
