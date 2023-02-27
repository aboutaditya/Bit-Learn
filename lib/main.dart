import 'package:bitbybit/pages/login.dart';
import 'package:bitbybit/pages/onboard.dart';
import 'package:bitbybit/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: OnBoarding());
  }
}
