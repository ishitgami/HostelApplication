// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:provider/provider.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.account_circle_rounded),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                authService.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, logInScreenRoute, (route) => false);
              },
            ),
            const SizedBox(width: 50, child: Divider()),
          ],
        ),
      ),
    );
  }
}
