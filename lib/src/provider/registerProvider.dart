// ignore: file_names
import 'package:antry/src/components/DialogBox.dart';
import 'package:antry/src/models/UserData.dart';
import 'package:antry/src/services/storage/userRegister.dart' show UserRegister;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import '../models/user.dart';
import '../services/network/registerApiCall.dart';
import '../views/login.dart';

DialogBox dialoBox = DialogBox();

class RegisterProvider extends ChangeNotifier {
  final register = RegisterApi();
  UserData? data;
  bool loading = false;

  getRegisterData(UserRegister userRegister, BuildContext context) async {
    loading = true;
    data = (await register.createUser(userRegister, context));
    loading = false;
    notifyListeners();
    // ignore: use_build_context_synchronously
    if (register.token!.success == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
      Fluttertoast.showToast(
          msg: "Registered Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      // ignore: use_build_context_synchronously
      dialoBox.showDialogBox(
          context, "Something Went Wrong! \n Log In later", Icons.error);
    }
  }
}
