// ignore_for_file: dead_code

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
          return Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView(
                  children: [
                    Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text('Page 1'),
                      ),
                    ),
                    Container( color: Colors.indigo,
                      child: const Center(
                        child: Text('Page 2'),
                      ),),
                    Container( color: Colors.green,
                      child: const Center(
                        child: Text('Page 3'),
                      ),),
                  ],
                ),
              ),
               Expanded(
                flex: 1,
                 child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           height: 80,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                  TextButton(onPressed: () {}, child: const Text('SKIP'),),
                   TextButton(onPressed: () {}, child: const Text('NEXT'))
                             ],
                           ),
                         ),
               )
            ],
          );
         
          
        },
      ),
    );
  }
}
