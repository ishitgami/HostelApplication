import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          child: Column(
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/profileimage.jpg"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Ishit G.",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "12345678900",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "03:30 PM",
                          style: TextStyle(fontSize: 18),
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
            ],
          ),
        ),
      ),
    );
  }
}
