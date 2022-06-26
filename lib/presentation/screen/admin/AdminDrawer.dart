import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/core/constant/string.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const adminDraweText = TextStyle(fontSize: 15);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // _createHeader(),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.account_circle_rounded),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(183, 203, 208, 211),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'Role             ',
                                  style: adminDraweText,
                                ),
                                Text(':', style: adminDraweText),
                                Text('     Rector', style: adminDraweText),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Hostel         ', style: adminDraweText),
                                Text(':'),
                                Text('     Hostel Name', style: adminDraweText),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Phone No   ', style: adminDraweText),
                                Text(':', style: adminDraweText),
                                Text('     +91 12345 56789',
                                    style: adminDraweText),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 50, child: Divider()),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.question,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Help'),
                ],
              ),
              onTap: () {
                 Navigator.pushNamed(context, helpscreenRoute);
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.signOut,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Log out'),
                ],
              ),
              onTap: () {
               
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 50, child: Divider()),
          ],
        ),
      ),
    );
  }
}
