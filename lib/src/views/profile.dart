import 'package:antry/src/views/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/profile_tfield.dart';
import '../models/UserData.dart';
import '../provider/loginProvider.dart';
import '../provider/registerProvider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

var name = TextEditingController();
//var lastName = TextEditingController();
var phoneControl = TextEditingController();
var rollControl = TextEditingController();
var courseControl = TextEditingController();
var branchControl = TextEditingController();
var semesterControl = TextEditingController();

class _ProfileState extends State<Profile> {
  @override
  initState() {
    super.initState();
    name.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginDataProvider>(context);
    final registerProvider = Provider.of<RegisterProvider>(context);
    final UserData? userLogin = registerProvider.data;
    final UserData? userRegister = loginProvider.data;
    name.text =
        userLogin?.data?.fullname ?? userRegister?.data?.fullname ?? 'Error';
    // lastName.text = 'Aryan';
    phoneControl.text =
        userLogin?.data?.contactno ?? userRegister?.data?.contactno ?? 'Error';
    rollControl.text =
        userLogin?.data?.rollno ?? userRegister?.data?.rollno ?? 'Error';
    courseControl.text =
        userLogin?.data?.course ?? userRegister?.data?.course ?? 'Error';
    branchControl.text =
        userLogin?.data?.branch ?? userRegister?.data?.branch ?? 'Error';
    semesterControl.text = userLogin?.data?.semester.toString() ??
        userRegister?.data?.semester.toString() ??
        'Error';

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            clipBehavior: Clip.none,
            decoration: const BoxDecoration(
              color: Color(0xffff725e), //Colors.black87,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 85,
                  child: AppBar(
                    leading: IconButton(
                      splashColor: Colors.black26,
                      splashRadius: 25,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    toolbarHeight: 150,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    // actions: [
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 0, right: 0),
                    //     child: TextButton(
                    //         onPressed: () {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => const Login(),
                    //             ),
                    //           );
                    //         },
                    //         child: Row(
                    //           children: const [
                    //             Text(
                    //               'Logout',
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               width: 5,
                    //             ),
                    //             Icon(
                    //               Icons.logout,
                    //               color: Colors.white,
                    //               size: 20,
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: MediaQuery.of(context).size.height - 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 50, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //clipBehavior: Clip.none,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        'Personal Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: SizedBox(
                        height: 50,
                        child: ProfileTfield(
                          controller: name,
                          label: 'Name',
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    //   child: SizedBox(
                    //     height: 50,
                    //     child: ProfileTfield(
                    //       controller: lastName,
                    //       label: 'Last Name',
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: SizedBox(
                        height: 50,
                        child: ProfileTfield(
                          controller: phoneControl,
                          label: 'Phone Number',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: SizedBox(
                        height: 50,
                        child: ProfileTfield(
                          controller: rollControl,
                          label: 'Roll ID',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: SizedBox(
                        height: 50,
                        child: ProfileTfield(
                          controller: courseControl,
                          label: 'Course',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ProfileTfield(
                                controller: branchControl,
                                label: 'Branch',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ProfileTfield(
                                controller: semesterControl,
                                label: 'Semester',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //logout button
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                                (route) => false,
                              );
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            //elevation: 2,
                            //backgroundColor: Colors.red,
                            side: const BorderSide(
                              color: Color(0xffff735b),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                              color: Color(0xffff735b),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 180,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/raj1.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
