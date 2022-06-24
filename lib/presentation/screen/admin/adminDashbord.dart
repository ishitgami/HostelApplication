import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hostelapplication/presentation/screen/admin/AdmincomplainScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/adminHome.dart';


class AdminDashbordScreen extends StatefulWidget {
  const AdminDashbordScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
}

class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
   int _selectedIndex = 0;
    static const List<Widget> _widgetOptions = <Widget>[
    AdminHome(),
    AdminComplainScreen(),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
  ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _selectedIndex,
         onTap: _onItemTapped,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Complain',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon:Icon(CupertinoIcons.wrench),
            label: 'Services',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon:Icon(CupertinoIcons.person_crop_circle_badge_minus),
            label: 'Leave',
            backgroundColor: Colors.pink,
          ),
          
        ]

        ),
      body: SafeArea(
        child:_widgetOptions.elementAt(_selectedIndex)
      ),
    );
  }
}