// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/modules/notice_model.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'package:hostelapplication/presentation/screen/admin/AdminDrawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    final noticeList = Provider.of<List<Notice>?>(context);
    final noticeProvider = Provider.of<NoticeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'DashBoard',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          Navigator.pushNamed(context, addNoticeScreenRoute);
        },
        child: const Icon(Icons.add),
      ),
      drawer: const AdminDrawer(),
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
                      element.url!, () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content:
                            const Text("Are you sure you want to delete ?"),
                        actions: [
                          TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              noticeProvider.deleteNotice(element.id);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                );
              })

          //  Padding(
          //     padding: EdgeInsets.all(12),
          //     child: ListView.builder(
          //         itemCount: noticeList.length,
          //         itemBuilder: (context, index) {
          //           return NoticeContainer(
          //             noticeList[index].notice,
          //             noticeList[index].time.day.toString() +
          //                 '/' +
          //                 noticeList[index].time.month.toString() +
          //                 '/' +
          //                 noticeList[index].time.year.toString(),
          //             noticeList[index].url!,
          //             () {
          //               showDialog(
          //                 context: context,
          //                 builder: (_) => AlertDialog(
          //                   content: Text("Are you sure you want to delete ?"),
          //                   actions: [
          //                     TextButton(
          //                       child: Text(
          //                         "Cancel",
          //                         style: TextStyle(color: Colors.black),
          //                       ),
          //                       onPressed: () {
          //                         Navigator.of(context).pop();
          //                       },
          //                     ),
          //                     TextButton(
          //                       child: Text(
          //                         "Delete",
          //                         style: TextStyle(color: Colors.red),
          //                       ),
          //                       onPressed: () {
          //                         noticeProvider
          //                             .deleteNotice(noticeList[index].id);
          //                         Navigator.of(context).pop();
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               );
          //             },
          //           );
          //         }),
          //   )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class NoticeContainer extends StatelessWidget {
  NoticeContainer(this.notice, this.date, this.src, this.delete, {Key? key})
      : super(key: key);
  String notice;
  String date;
  String adminname = "Admin";
  String src;
  Function delete;
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
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade900,
                child: Center(
                  child: Text(
                    "${adminname[0]}",
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Text(date, style: TextStyle(fontSize: 12)),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  delete();
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
          Divider(),
          const SizedBox(
            height: 5,
          ),
          Text(
            notice,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          src == ""
              ? SizedBox()
              : Center(
                  child: Image.network(
                  src,
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                )),
        ],
      ),
    );
  }
}
