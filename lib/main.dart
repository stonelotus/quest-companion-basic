import 'package:flutter/material.dart';
import 'package:quest_companion/firebase_options.dart';
import 'package:quest_companion/screens/LoginScreen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quest_companion/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quest Companion',
      home: LoginScreen(),
    );
  }
}
