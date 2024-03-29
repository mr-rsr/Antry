import 'dart:math';

import 'package:antry/src/models/UserData.dart';
import 'package:antry/src/provider/registerProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/loginProvider.dart';

import '../views/profile.dart';
import 'bottom_curve_cipper.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginDataProvider>(context);
    final registerProvider = Provider.of<RegisterProvider>(context);
    final UserData? userLogin = registerProvider.data;
    final UserData? userRegister = loginProvider.data;
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 300,
        color: const Color(0xffff735b), //Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: AppBar(
                leading: IconButton(
                  splashColor: Colors.grey,
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },
                  icon: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                toolbarHeight: 200,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 8.0),
                    child: IconButton(
                      splashColor: Colors.grey,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Welcome ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                userLogin?.data?.fullname ??
                    userRegister?.data?.fullname ??
                    'Something went wrong',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                userLogin?.data?.rollno ??
                    userRegister?.data?.rollno ??
                    'Error',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
