import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/cubit/splashscreen_cubit.dart';
import 'package:hostelapplication/presentation/screen/admin/adminDashbord.dart';
import 'package:hostelapplication/presentation/screen/auth/logInScreen.dart';
import 'package:hostelapplication/presentation/screen/auth/registrationScreen.dart';
import 'package:hostelapplication/presentation/screen/onBordingScreen.dart';
import 'package:hostelapplication/presentation/screen/splashScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashscreenCubit(),
            child: const SplashScreen(),
          ),
        );

      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      case logInScreenRoute:
        return MaterialPageRoute(builder: (context) => const LogInScreen());

      case registrationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen());

      case adminDashbordScreenRoute:
        return MaterialPageRoute(builder: (context) => const AdminDashbordScreen());

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
