import 'package:shared_preferences/shared_preferences.dart';

class UserDataSp {
  addUser(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', data);
  }

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('data')!;
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('data');
  }

  Future<bool> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('data');
  }
}
