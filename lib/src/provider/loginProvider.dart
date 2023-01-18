import 'package:antry/src/models/UserData.dart';
import 'package:antry/src/views/dashBoard.dart';
// import 'package:antry/src/views/login.dart';
import 'package:flutter/material.dart';

import '../services/network/loginApiCall.dart';
import '../services/storage/userLogin.dart';
import '../views/login.dart';

class LoginDataProvider extends ChangeNotifier {
  final login = LoginApi();
  UserData? data;
  bool loading = false;

  getUserData(UserLogin log, BuildContext context) async {
    loading = true;
    data = (await login.getUserData(context, log));
    loading = false;
    notifyListeners();
    if (data?.success == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      dialoBox.showDialogBox(
          context, "Something Went Wrong! \n Log In later", Icons.error);
    }
  }
}
