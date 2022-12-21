// ignore: file_names
//import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/UserData.dart';
import '../../models/loginToken.dart';
import '../../models/user.dart';
import '../storage/sharedPreferences/TokenSp.dart';
import '../storage/userLogin.dart';
import '../storage/userRegister.dart';

const String baseUrl = 'http://10.60.42.160:5252';
var isLoaded = false;
final tokenSp=TokenSp();
class LoginRegister {
  final dio = Dio(BaseOptions(
    connectTimeout: 30000,
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    //contentType: ContentType.json.toString(),
  ));

//hostel http://10.60.42.160:5252
  Future<User?> createUser(UserRegister userRegister) async {
    isLoaded = false;
    Map data = {
      "fullname": userRegister.fullname,
      "rollno": userRegister.id,
      "branch": userRegister.branch,
      "course": userRegister.course,
      "semester": userRegister.semester,
      "contactNo": userRegister.contact,
    };
//10.60.17.77:5252 iot
//http://10.36.124.78:5252 innovation
    User? retrievedUser;
    try {
      Response response =
          await dio.post('/api/auth/student/register', data: data);
      debugPrint(response.data.toString());
      retrievedUser = User.fromJson(response.data);
      isLoaded = true;
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return retrievedUser;
  }

  Future<UserData?> loginToken(UserLogin login) async {
    isLoaded = false;
    Map loginData = {
      "contactno": login.contactno,
      "password": login.rollid,
    };
// debugPrint(loginData['contactno']);
// debugPrint(loginData['password']);
    LoginToken? retrievedToken;
    UserData? retrievedUser;
    try {
      Response response =
          await dio.post('/api/auth/student/login', data: loginData);
      debugPrint(response.data.toString());
      retrievedToken = LoginToken.fromJson(response.data);
      debugPrint(retrievedToken.token.toString());
      await tokenSp.addToken(retrievedToken.token.toString());
      retrievedUser= await getUserData(retrievedToken);
     
    } on DioError catch (e) {
      debugPrint(e.message);
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
      isLoaded = true;
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return retrievedUser;
  }
}
