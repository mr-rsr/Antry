// import 'package:antry/src/models/UserData.dart';
// import 'package:antry/src/views/login.dart';
import 'package:antry/src/services/storage/userRegister.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/network/loginRegister.dart';

class RegisterProvider extends ChangeNotifier {
  final register = LoginRegister();
  User? data;
  bool loading = false;
  getRegisterData(UserRegister userRegister) async {
    loading = true;
    data = (await register.createUser(userRegister));
    loading = false;
    notifyListeners();
  }
}
