import 'package:flutter/material.dart';
import 'package:hostelapplication/logic/provider/complaint_provider.dart';
import 'package:hostelapplication/logic/provider/notice_provider.dart';
import 'package:hostelapplication/logic/provider/userData_provider.dart';
import 'package:hostelapplication/logic/service/auth_services/auth_service.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/complaint_firestore_service.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/notice_firestore_service.dart';
import 'package:hostelapplication/logic/service/fireStoreServices/user_firestore_services.dart';
import 'package:hostelapplication/presentation/router/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  int? initScreen;

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<UserDataFirestoreService>(
          create: (_) => UserDataFirestoreService(),
        ),
        ChangeNotifierProvider.value(
          value: NoticeProvider(),
        ),
        StreamProvider.value(
          value: NoticeFirestoreService().getNotice(),
          initialData: null,
        ),
        StreamProvider.value(
          value: ComplaintFirestoreService().getComplaintForAdmin(),
          initialData: null,
        ),
        ChangeNotifierProvider.value(
          value: ComplaintProvider(),
        ),
        StreamProvider.value(
          value: UserDataFirestoreService().getUserData(),
          initialData: null,
        ),
        ChangeNotifierProvider.value(
          value: ComplaintProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UsereDataProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
