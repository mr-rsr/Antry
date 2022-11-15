
import 'package:antry/src/views/login.dart';
import 'package:antry/src/views/qrScanner.dart';
import 'package:antry/src/views/register.dart';
import 'package:antry/src/views/splash.dart';
import 'package:antry/src/views/success.dart';
import 'package:flutter/material.dart'; 
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

