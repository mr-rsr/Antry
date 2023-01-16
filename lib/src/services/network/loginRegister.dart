// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:antry/src/services/Exception/DioException.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/DialogBox.dart';
import '../../models/UserData.dart';
import '../../models/loginToken.dart';
import '../../models/user.dart';
import '../storage/sharedPreferences/TokenSp.dart';
import '../storage/userLogin.dart';
import '../storage/userRegister.dart';
import 'package:fluttertoast/fluttertoast.dart';

DialogBox dialoBox = DialogBox();
const String baseUrl = 'http://10.60.42.1:5252';
var isLoaded = false;
final tokenSp = TokenSp();

class LoginRegister {
  final dio = Dio(BaseOptions(
    connectTimeout: 3000,
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    contentType: ContentType.json.toString(),
  ));

//hostel http://10.60.42.160:5252
//10.60.17.77:5252 iot
//http://10.36.124.78:5252 innovation

//register api
  Future<User?> createUser(
      UserRegister userRegister, BuildContext context) async {
    isLoaded = false;
    Map data = {
      "fullname": userRegister.fullname,
      "rollno": userRegister.id,
      "branch": userRegister.branch,
      "course": userRegister.course,
      "semester": userRegister.semester,
      "contactNo": userRegister.contact,
    };
    User? retrievedUser;
    try {
      Response response =
          await dio.post('/api/auth/student/register', data: data);
      debugPrint(response.data.toString());
      retrievedUser = User.fromJson(response.data);
      isLoaded = true;
    } on DioError catch (e) {
      //Navigator.pop(context);
      showDialogBoxTest(context, e.message, Icons.error);

      debugPrint("Error: ${e.message}");
      DioException dioException = DioException.fromDioError(e);
      //Navigator.pop(context);
      // Fluttertoast.showToast(
      //     msg: dioException.errorMessage,
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      //dialoBox.showDialogBox(context, e.message, Icons.error);
    }
    return retrievedUser;
  }

  showDialogBoxTest(BuildContext context, String message, IconData prefixIcon) {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AlertDialog(
                  backgroundColor: const Color(0xffeeeded),
                  icon: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        prefixIcon,
                        color: const Color(0xfff2735b),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        message,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 15),
                      )
                    ],
                  )),
                  content: Text(
                    message,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 15),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(
                            color: Color(0xfff2735b),
                            fontFamily: "Roboto",
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

//loginToken api
  Future<UserData?> loginToken(UserLogin login, BuildContext context) async {
    isLoaded = false;
    Map loginData = {
      "contactno": login.contactno,
      "password": login.rollid,
    };
    LoginToken? retrievedToken;
    UserData? retrievedUser;
    try {
      Response response =
          await dio.post('/api/auth/student/login', data: loginData);
      debugPrint(response.data.toString());
      retrievedToken = LoginToken.fromJson(response.data);
      debugPrint(retrievedToken.token.toString());
      await tokenSp.addToken(retrievedToken.token.toString());
      retrievedUser = await getUserData(retrievedToken);
    } on DioError catch (e) {
      DioException dioException = DioException.fromDioError(e);

      dialoBox.showDialogBox(context, dioException.errorMessage, Icons.error);
    }
    return retrievedUser;
  }

//LoginToken retrievedToken
  Future<UserData?> getUserData(LoginToken retrievedToken) async {
    UserData? retrievedUser;
    try {
      dio.options.headers['x-auth-student'] = retrievedToken.token.toString();
      // dio.options.headers['x-auth-student'] = token;
      Response response = await dio.get("/api/auth/student/decode");
      debugPrint(response.data.toString());
      retrievedUser = UserData.fromJson(response.data);
      debugPrint(retrievedUser.toString());
      isLoaded = true;
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return retrievedUser;
  }
}
