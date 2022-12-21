 import 'package:antry/src/models/UserData.dart';
// import 'package:antry/src/views/login.dart';
 import 'package:flutter/material.dart';

 import '../services/network/loginRegister.dart';
import '../services/storage/userLogin.dart';



 class LoginDataProvider extends ChangeNotifier {
   final login = LoginRegister();
   UserData? data;
   bool loading = false;

   getUserData(UserLogin log) async {
     loading = true;
    data = (await login.loginToken(log));
     loading = false;
   notifyListeners();
   }
 }