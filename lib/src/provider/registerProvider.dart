// import 'package:antry/src/models/UserData.dart';
// import 'package:antry/src/views/login.dart';
import 'dart:async';

import 'package:antry/src/services/storage/userRegister.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../services/network/loginRegister.dart';
import '../views/login.dart';

class RegisterProvider extends ChangeNotifier {
  final register = LoginRegister();
  User? data;
  bool loading = false;

  getRegisterData(UserRegister userRegister, BuildContext context) async {
    loading = true;
    showDialogBox(context);
    data = (await register.createUser(userRegister));
    loading = false;
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
    notifyListeners();
  }

  showDialogBox(BuildContext context) {
    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AlertDialog(
                  backgroundColor: const Color(0xffeeeded),
                  icon: Center(
                      child: registerProvider.loading == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: Color(0xfff2735b),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "Registering...",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xfff2735b),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Succesfully Registered",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 15),
                                )
                              ],
                            )),
                )
                //title: Text("Please wait..."),
                ),
          );
        });
  }
}
