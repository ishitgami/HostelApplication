// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/presentation/screen/Widgets/full_screen_view.dart';
import 'package:hostelapplication/presentation/screen/student/studentDrawer.dart';
// import 'package:image_downloader/image_downloader.dart';
import 'package:intl/intl.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'DashBoard',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Brazila",
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const StudentDrawer(),
      body: noticeList != null
          ? GroupedListView<Notice, String>(
              elements: [...noticeList],
              groupBy: (element) {
                final formattedDate =
                    DateFormat('dd MMMM yyyy').format(element.time);

                return formattedDate;
              },
              groupSeparatorBuilder: (String value) => Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          value.toString() == 'null'
                              ? 'No Date'
                              : value.toString() == 'All'
                                  ? 'All'
                                  : "$value",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
              order: GroupedListOrder.DESC,
              itemBuilder: (c, element) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NoticeContainer(
                      element.notice,
                      element.time.day.toString() +
                          '/' +
                          element.time.month.toString() +
                          '/' +
                          element.time.year.toString(),
                      element.url!),
                );
              })
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
            // var imageId = await ImageDownloader.downloadImage(src);
            // if (imageId == null) {
            //   return print("Image download faild");
            // }
          } on PlatformException catch (error) {
            print(error);
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade900,
                    child: Center(
                      child: Text(
                        "${name[0]}",
                        style: TextStyle(fontSize: 18),
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
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      // Text(date, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              src == ""
                  ? SizedBox()
                  : PopupMenuButton<String>(
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
          Divider(),
          BulletLists(
            notice,
          ),
          const SizedBox(
            height: 5,
          ),
          src == ""
              ? SizedBox()
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullImageView(
                          imageurl: src,
                        ),
                      ),
                    );
                  },
                  child: Center(
                      child: Image.network(
                    src,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox();
                    },
                  )),
                ),
        ],
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '\u2022',
              style: TextStyle(
                fontSize: 20,
                // height: 1.55,
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
                  fontSize: 16,
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
