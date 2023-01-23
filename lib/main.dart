import 'package:antry/src/provider/loginProvider.dart';
import 'package:antry/src/provider/registerProvider.dart';
import 'package:antry/src/views/dashBoard.dart';
import 'package:antry/src/views/login.dart';
import 'package:antry/src/views/profile.dart';
import 'package:antry/src/views/splash.dart';
import 'package:antry/src/views/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
    ChangeNotifierProvider(create: (_) => LoginDataProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Antry',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
