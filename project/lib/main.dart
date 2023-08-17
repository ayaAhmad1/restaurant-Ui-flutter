import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/outlineScreen.dart';
import 'package:project/welcome/onBoardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAuthenticated = await checkAuthenticationState();
  await Firebase.initializeApp();
  runApp(MyApp(isAuthenticated: isAuthenticated));
}

Future<bool> checkAuthenticationState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
  return isAuthenticated;
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  MyApp({required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: isAuthenticated ? OutlineScreen():onBoardingScreen(),
    );
  }
}
