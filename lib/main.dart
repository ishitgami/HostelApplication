import 'package:flutter/material.dart';
import 'package:hostelapplication/presentation/router/route.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async{
  int? initScreen;
   WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
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


