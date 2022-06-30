import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:provider/provider.dart';

import '../student/studentHome.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final noticeList = Provider.of<List<Notice>?>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(183, 203, 208, 211),
      appBar: AppBar(
        title: const Text('DashBoard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, adminnotificationRoute);
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, addNoticeScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
      drawer: const AdminDrawer(),
      body: noticeList != null
          ? Padding(
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                  itemCount: noticeList.length,
                  itemBuilder: (context, index) {
                    return NoticeContainer(
                        noticeList[index].notice,
                        noticeList[index].time.day.toString() +
                            '/' +
                            noticeList[index].time.month.toString() +
                            '/' +
                            noticeList[index].time.year.toString(),
                            noticeList[index].url
                            );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         NoticeContainer(
      //             'All New Admitted Hostel Student of BE - 2 nd and 3 rd Year are informed to bring their latest GTU grade history print out in addition to other Documents mentioned in previous notice.'),
      //         NoticeContainer(
      //             'Is stated that I have taken admission in your respective university. I belong from another city and that is very far from the university. It would not be possible for me to afford the transportation of every day and it is quite a lot haste.'),
      //         NoticeContainer(
      //             'Letters should be addressed to the Superintendent of Hostels. In case of official letters, these should be routed through the Head of the Department or the Registrar (in the case of Undergraduates and Trainees) or the Principal College of Nursing (for students of Nursing). Letters should be handed over to the Hostel Office (in the Gents Hostels) and a receipt obtained if delivered by hand.'),
      //         NoticeContainer(
      //             '1. Application for admission to hostel shall be made in the prescribed form which can be had from the Hostel Office. 2. Allotement of rooms shall be made by the Deputy Wardens under the orders of Warden.'),
      //         NoticeContainer(
      //             '2.  In this Act  unless the context otherwise requires, Ragging means display of  noisy disorderly conduct doing any act which causes or is likely to cause physical or psychological harm or raise apprehension  or fear or shame or  embarrassment to a student in any educational institution and includes,'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, this.date,this.src,{Key? key}) : super(key: key);
  String notice;
  String date;
  String adminname = "Admin";
  String src;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Center(
                    child: Text(
                      "${adminname[0]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(date, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BulletLists(
              notice,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(src),
          ],
        ),
      ),
    );
  }
}
