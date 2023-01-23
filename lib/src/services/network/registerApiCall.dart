import 'dart:convert';
import 'dart:io';
import 'package:antry/src/components/DialogBox.dart';
import 'package:antry/src/models/UserData.dart';
import 'package:antry/src/models/loginToken.dart';
import 'package:antry/src/services/Exception/DioException.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../storage/sharedPreferences/TokenSp.dart';
import '../storage/sharedPreferences/UserDataSp.dart';
import '../storage/userLogin.dart';
import '../storage/userRegister.dart';
import 'package:antry/src/components/LoadingDialogBox.dart';
import 'package:antry/src/services/network/loginApiCall.dart';

LoginApi login = LoginApi();
DialogBox dialoBox = DialogBox();
LoadingDialogBox loadingDialogBox = LoadingDialogBox();
const String baseUrl = 'http://10.60.42.1:5252';
var isLoaded = false;
final tokenSp = TokenSp();
final userSp = UserDataSp();

class RegisterApi {
  LoginToken? token;
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
  Future<UserData?> createUser(
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
    UserData? retrievedUser;
    try {
      loadingDialogBox.showDialogBox(context, "Registering...");
      Response response =
          await dio.post('/api/auth/student/register', data: data);
      debugPrint(response.data.toString());
      retrievedUser = UserData.fromJson(response.data);
      await userSp.addUser(response.data.toString());
      // direect signin
      UserLogin userLogin = UserLogin(
        contactno: userRegister.contact,
        rollid: userRegister.id,
      );
      // ignore: use_build_context_synchronously
      token = await login.loginToken(userLogin, context);
      isLoaded = true;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on DioError catch (e) {
      Navigator.pop(context);
      DioException dioException = DioException.fromDioError(e);
      dialoBox.showDialogBox(context, dioException.errorMessage, Icons.error);
    }
    return retrievedUser;
  }
}
