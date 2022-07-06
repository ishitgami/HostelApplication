// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    final noticeList = Provider.of<List<Notice>?>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      drawer: const StudentDrawer(),
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
                        noticeList[index].url);
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, this.date, this.src, {Key? key})
      : super(key: key);
  String notice;
  String date;
  String name = "Admin";
  String src;

  var myMenuItems = <String>[
    'Save Image',
  ];

  void onSelect(item) async {
    switch (item) {
      case 'Save Image':
        {
          try {
            var imageId = await ImageDownloader.downloadImage(src);
            if (imageId == null) {
              return print("Image download faild");
            }
          } on PlatformException catch (error) {
            print(error);
          }
        }
        break;
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Center(
                        child: Text(
                          "${name[0]}",
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(date, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                    onSelected: onSelect,
                    itemBuilder: (BuildContext context) {
                      return myMenuItems.map((String choice) {
                        return PopupMenuItem<String>(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList();
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BulletLists(
              notice,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: Image.network(src)),
          ],
        ),
      ),
    );
  }
}

class BulletLists extends StatelessWidget {
  BulletLists(this.str);
  final String str;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '\u2022',
              style: TextStyle(
                fontSize: 20,
                height: 1.55,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                "${str}",
                textAlign: TextAlign.left,
                softWrap: true,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  height: 1.55,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
