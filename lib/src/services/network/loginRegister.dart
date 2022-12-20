// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/user.dart';
import '../storage/userLogin.dart';
import '../storage/userRegister.dart';

class LoginRegister {
  var dio = Dio();

  Future<User?> createUser(UserRegister userRegister) async {
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
      Response response = await dio.post('https://antry.herokuapp.com/api/auth/register', data: data);
      debugPrint(response.data.toString());
      retrievedUser = User.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return retrievedUser;
  }

  Future<User?> userLogin(UserLogin login) async {
    Map loginData = {
      "contactno": login.contactno,
      "password": login.rollid,
    };
debugPrint(loginData['contactno']);
debugPrint(loginData['password']);
    User? retrievedUser;
    try {
      Response response = await dio.post('https://antry.herokuapp.com/api/auth/login', data: loginData);
      debugPrint(response.data.toString());
      retrievedUser = User.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint(e.message);
    }
    return retrievedUser;
  }
}
