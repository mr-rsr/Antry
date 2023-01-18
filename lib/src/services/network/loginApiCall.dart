// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:antry/src/components/DialogBox.dart';
import 'package:antry/src/services/Exception/DioException.dart';
import 'package:dio/dio.dart'
    show BaseOptions, Dio, DioError, Response, ResponseType;
import 'package:flutter/material.dart';
import '../../models/UserData.dart';
import '../../models/loginToken.dart';
import '../storage/sharedPreferences/TokenSp.dart';
import '../storage/sharedPreferences/UserDataSp.dart';
import '../storage/userLogin.dart';
import 'package:antry/src/components/LoadingDialogBox.dart';

DialogBox dialoBox = DialogBox();
LoadingDialogBox loadingDialogBox = LoadingDialogBox();
const String baseUrl = 'http://10.60.42.1:5252';
var isLoaded = false;
final tokenSp = TokenSp();
final userSp = UserDataSp();

class LoginApi {
  final dio = Dio(BaseOptions(
    connectTimeout: 3000,
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    contentType: ContentType.json.toString(),
  ));

//hostel http://10.60.42.160:5252
//10.60.17.77:5252 iot
//http://10.36.124.78:5252 innovation
//loginToken api
  Future<LoginToken?> loginToken(UserLogin login, BuildContext context) async {
    isLoaded = false;
    Map loginData = {
      "contactno": login.contactno,
      "password": login.rollid,
    };
    LoginToken? retrievedToken;
    // UserData? retrievedUser;
    try {
      Response response =
          await dio.post('/api/auth/student/login', data: loginData);
      debugPrint(response.data.toString());
      retrievedToken = LoginToken.fromJson(response.data);
      debugPrint(retrievedToken.token.toString());
      await tokenSp.addToken(retrievedToken.token.toString());
      //  retrievedUser = await getUserData(retrievedToken);
    } on DioError catch (e) {
      Navigator.pop(context);
      DioException dioException = DioException.fromDioError(e);
      dialoBox.showDialogBox(context, dioException.errorMessage, Icons.error);
    }
    return retrievedToken;
  }

//LoginToken retrievedToken
  Future<UserData?> getUserData(BuildContext context, UserLogin login) async {
    UserData? retrievedUser;
    try {
      loadingDialogBox.showDialogBox(context, "Logging...");
      LoginToken? retrievedToken = await loginToken(login, context);
      dio.options.headers['x-auth-student'] = retrievedToken?.token.toString();
      Response response = await dio.get("/api/auth/student/decode");
      debugPrint(response.data.toString());
      retrievedUser = UserData.fromJson(response.data);
      await userSp.addUser(response.data.toString());
      debugPrint(retrievedUser.toString());
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
