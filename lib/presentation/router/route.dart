import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';

import 'package:hostelapplication/presentation/screen/admin/notice/addNoticeScreen.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/admin/admindetilaspage/admindetails.dart';
import 'package:hostelapplication/presentation/screen/auth/logInScreen.dart';
import 'package:hostelapplication/presentation/screen/auth/registrationScreen.dart';
import 'package:hostelapplication/presentation/screen/onBordingScreen.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';
import 'package:hostelapplication/presentation/screen/student/Drawer/helpscreen.dart';
import 'package:hostelapplication/presentation/screen/student/leave/studentAddLeave.dart';
import 'package:hostelapplication/presentation/screen/student/services/bathroomService.dart';
import 'package:hostelapplication/presentation/screen/student/services/messService.dart';
import 'package:hostelapplication/presentation/screen/student/services/otherServices.dart';
import 'package:hostelapplication/presentation/screen/student/services/roomService.dart';
import 'package:hostelapplication/presentation/screen/student/services/studentElectricServices.dart';
import 'package:hostelapplication/presentation/screen/student/detailspage/studentdetails.dart';
import 'package:hostelapplication/presentation/screen/student/studentDashbord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Routes {
  late int initScreen;
  Future<void> checkForOnBordScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen")!;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen1());

      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case logInScreenRoute:
        return MaterialPageRoute(builder: (context) => LogInScreen());

      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case adminDashbordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDashbordScreen());

      case studentDashboardScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDashboardScreen());

      case studentDetailScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentDetailScreen());

      case addNoticeScreenRoute:
        return MaterialPageRoute(builder: (context) => AddNoticeScreen());

      case helpscreenRoute:
        return MaterialPageRoute(builder: (context) => const HelpScreen());

      case studentElectricityServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentElectricityServices());
      
       case studentRoomServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentRoomServices());
      
       case studentMessServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentMessServices());
      
         case studentBathRoomServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentBathroomServices());
        
         case studentOtherServiceRoute:
        return MaterialPageRoute(
            builder: (context) => const StudentOtherServices());



      case adminDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AdminDetailsScreen());

      case studentLeaveScreenRoute:
        return MaterialPageRoute(builder: (context) => const StudentAddLeave());


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
