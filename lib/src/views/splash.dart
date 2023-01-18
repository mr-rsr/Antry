import 'package:antry/src/services/network/loginApiCall.dart';
import 'package:antry/src/services/storage/sharedPreferences/TokenSp.dart';
import 'package:antry/src/views/dashBoard.dart';
import 'package:antry/src/views/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

final TokenSp tokenSp = TokenSp();
LoginApi register = LoginApi();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 2;
  // duration of splash screen on second
  checkTokenAvailability() async {
    bool token = await tokenSp.checkToken();
    if (token == true) {
      Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          debugPrint(token.toString());
          // ignore: unrelated_type_equality_checks
          return const Register();
        }));
      });
      return token;
    } else {
      Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
            //pushReplacement = replacing the route so that
            //splash screen won't show on back button press
            //navigation to Home page.
            builder: (context) {
          // ignore: unrelated_type_equality_checks
          return const Login();
        }));
      });
    }
  }

  @override
  void initState() {
    checkTokenAvailability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              //vertically align center
              children: <Widget>[
                // const SizedBox(
                //   height: 50,
                // ),
                Image.asset("assets/images/QrSplash.gif",
                    width: 250, height: 350),
                const SizedBox(
                  height: 30,
                ),
                Column(children: <Widget>[
                  Image.asset("assets/images/logoBlack.png"),
                  const Text(
                    "Scan & Enter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])
              ]),
        ));
  }
}
