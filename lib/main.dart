import 'package:antry/src/views/dashBoard.dart';
import 'package:antry/src/views/login.dart';
import 'package:antry/src/views/splash.dart';
import 'package:antry/src/views/register.dart';
import 'package:antry/src/views/tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Antry',
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

