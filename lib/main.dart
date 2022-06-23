import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/router/route.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


