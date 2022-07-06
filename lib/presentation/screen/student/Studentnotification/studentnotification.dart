import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Studentnotification extends StatelessWidget {
  const Studentnotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return StudentNotificationListModel(
                    "Ishit G.",
                    "assets/images/profileimage.jpg",
                    "19021010700",
                    "3.30 PM"); //TODO: fix using firebase
              },
            ),
          ),
        ));
  }
}

class StudentNotificationListModel extends StatelessWidget {
  StudentNotificationListModel(
      this.name, this.imagesrc, this.enrollno, this.time,
      {Key? key})
      : super(key: key);
  String name;
  String imagesrc;
  String enrollno;
  String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("$imagesrc"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$enrollno",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
