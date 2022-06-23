import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostelapplication/core/constant/string.dart';
import 'package:hostelapplication/logic/cubit/splashscreen_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashscreenCubit, SplashscreenState>(
        builder: (context, state) {
          if (state is SplashscreenInitial) {
               print('navigate');
            Future.delayed(
              const Duration(milliseconds: 500),
            
            );
            () {
               print('navigate222');
              Navigator.pushReplacementNamed(context, logInScreenRoute);
            };
          }
          return Container(
            color: Colors.amber,
            child: const Center(
              child: Text('SplashScreen'),
            ),
          );
        },
      ),
    );
  }
}

