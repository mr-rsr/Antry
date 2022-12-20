import 'package:antry/src/views/dashBoard.dart';
import 'package:antry/src/views/register.dart';
import 'package:flutter/material.dart';

import '../services/network/loginRegister.dart';
import '../services/storage/userLogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});
//Color(0xfff2725e) orangered
//color(0xffe6e6e6)
  @override
  State<Login> createState() => _LoginState();
}

LoginRegister loginRegister = LoginRegister();

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  late TabController _tabController;
  final visitorname=TextEditingController();
  final visitorPhoneController = TextEditingController();
  final visitorCity= TextEditingController();

  bool isPassVisible = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    phoneController.addListener(() => setState(() {}));
    passController.addListener(() => setState(() {}));
    visitorPhoneController.addListener(() => setState(() {}));
     visitorCity.addListener(() => setState(() {}));
      visitorname.addListener(() => setState(() {}));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Image(
                image: AssetImage('assets/images/84011.jpg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 35,
                  color: Color(0xffff735b),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Form(
            //     key: _formKey,
            //     child: Column(
            //       children: <Widget>[
            //         TextFormField(
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please enter phone number';
            //             }
            //             if (value.length < 10) {
            //               return 'Please enter valid phone number';
            //             }
            //             return null;
            //           },
            //           keyboardType: TextInputType.phone,
            //           controller: phoneController,
            //           decoration: InputDecoration(
            //             labelText: "Phone Number",
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             prefixIcon: const Icon(
            //               Icons.call,
            //               color: Color.fromARGB(255, 128, 127, 127),
            //             ),
            //             suffixIcon: phoneController.text.isEmpty
            //                 ? Container(
            //                     width: 0,
            //                   )
            //                 : IconButton(
            //                     onPressed: () => phoneController.clear(),
            //                     icon: const Icon(
            //                       Icons.close,
            //                       color: Color.fromARGB(255, 128, 127, 127),
            //                     )),
            //             labelStyle: const TextStyle(
            //               color: Color.fromARGB(255, 128, 127, 127),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: const BorderSide(color: Colors.black),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         TextFormField(
            //           controller: passController,
            //           obscureText: !isPassVisible,
            //           decoration: InputDecoration(
            //             labelText: "Password",
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             prefixIcon: const Icon(
            //               Icons.lock,
            //               color: Color.fromARGB(255, 128, 127, 127),
            //             ),
            //             suffixIcon: IconButton(
            //                 onPressed: () {
            //                   setState(() {
            //                     isPassVisible = !isPassVisible;
            //                   });
            //                 },
            //                 icon: isPassVisible
            //                     ? const Icon(
            //                         Icons.visibility_off,
            //                         color: Color.fromARGB(255, 128, 127, 127),
            //                       )
            //                     : const Icon(
            //                         Icons.visibility,
            //                         color: Color.fromARGB(255, 128, 127, 127),
            //                       )),
            //             labelStyle: const TextStyle(
            //               color: Color.fromARGB(255, 128, 127, 127),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: const BorderSide(color: Colors.black),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         const SizedBox(
            //           height: 40,
            //         ),
            //         ElevatedButton(
            //           onPressed: () {
            //             setState(() {
            //               if (_formKey.currentState!.validate() ||
            //                   phoneController.text.length == 10) {
            //                 loginRegister.userLogin(UserLogin(
            //                     contactno: phoneController.text,
            //                     rollid: passController.text));
            //                 debugPrint(phoneController.text);
            //                 debugPrint(passController.text);
            //               }
            //             });
            //           },
            //           style: ButtonStyle(
            //             minimumSize: MaterialStateProperty.all<Size>(
            //               const Size(double.infinity, 40),
            //             ),
            //             maximumSize: MaterialStateProperty.all<Size>(
            //               const Size(double.infinity, 50),
            //             ),
            //             backgroundColor: MaterialStateProperty.all(
            //               const Color(0xffff735b),
            //             ),
            //             shape:
            //                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //               RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0),
            //               ),
            //             ),
            //           ),
            //           child: const Center(
            //             child: Text(
            //               "Login",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 30,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             const Text(
            //               "Don't have an account?",
            //               style: TextStyle(
            //                 color: Colors.black,
            //               ),
            //             ),
            //             TextButton(
            //               onPressed: () {
            //                 setState(() {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) => const Register(),
            //                     ),
            //                   );
            //                 });
            //               },
            //               child: const Text(
            //                 "Register",
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 400,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: TabBar(
                      unselectedLabelStyle: const TextStyle(fontSize: 15),
                      unselectedLabelColor: Colors.black54,
                      //indicatorColor: const Color(0xffff735b),
                      indicator: const BoxDecoration(
                        color: Color(0xffff735b),
                        // color: Color(0xffff735b),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),

                      // indicatorWeight: 3,
                      labelColor: Colors.white,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            "Students",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Visitors",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          // border: Border(
                          //   //left:
                          //   left: BorderSide(
                          //     color: Colors.grey[500]!,
                          //     width: 1,
                          //   ),
                          //   right: BorderSide(
                          //     color: Colors.grey[500]!,
                          //     width: 1,
                          //   ),
                          //   bottom: BorderSide(
                          //     color: Colors.grey[500]!,
                          //     width: 1,
                          //   ),
                          // ),
                          //color: Colors.black,
                          // borderRadius: BorderRadius.circular(11)
                          ),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: <Widget>[
                          studentlogin(),
                          visitorlogin(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }

  Widget studentlogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              if (value.length < 10) {
                return 'Please enter valid phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            controller: phoneController,
            decoration: InputDecoration(
              // isDense: true, // Added this
              contentPadding: const EdgeInsets.all(16),
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(
                Icons.call,
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              suffixIcon: phoneController.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () => phoneController.clear(),
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 128, 127, 127),
                      )),
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passController,
            obscureText: !isPassVisible,
            decoration: InputDecoration(
              // isDense: true, // Added this
              contentPadding: const EdgeInsets.all(16),
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassVisible = !isPassVisible;
                    });
                  },
                  icon: isPassVisible
                      ? const Icon(
                          Icons.visibility_off,
                          color: Color.fromARGB(255, 128, 127, 127),
                          size: 28,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 128, 127, 127),
                        )),
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                );
                // if (_formKey.currentState!.validate() ||
                //     phoneController.text.length == 10) {
                //   loginRegister.userLogin(UserLogin(
                //       contactno: phoneController.text,
                //       rollid: passController.text));
                //   debugPrint(phoneController.text);
                //   debugPrint(passController.text);
                // }
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 40),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xffff735b),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  });
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget visitorlogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (value) {
              if (!value!.contains(' ')) {
                return 'Please enter full name';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            controller: visitorname,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              // isDense: true, // Added this
              contentPadding: const EdgeInsets.all(16),
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              suffixIcon: visitorname.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () => visitorname.clear(),
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 128, 127, 127),
                      )),
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              if (value.length < 10) {
                return 'Please enter valid phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            controller: visitorPhoneController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              // isDense: true, // Added this
              contentPadding: const EdgeInsets.all(16),
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(
                Icons.call,
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              suffixIcon: visitorPhoneController.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () => visitorPhoneController.clear(),
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 128, 127, 127),
                      )),
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller:visitorCity,
           keyboardType: TextInputType.streetAddress,
           textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              // isDense: true, // Added this
              contentPadding: const EdgeInsets.all(16),
              labelText: "City",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(
                Icons.location_city,
                color: Color.fromARGB(255, 128, 127, 127),
              ),
               suffixIcon: visitorCity.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () => visitorCity.clear(),
                      icon: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 128, 127, 127),
                      ),),
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 128, 127, 127),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                );
                // if (_formKey.currentState!.validate() ||
                //     phoneController.text.length == 10) {
                //   loginRegister.userLogin(UserLogin(
                //       contactno: phoneController.text,
                //       rollid: passController.text));
                //   debugPrint(phoneController.text);
                //   debugPrint(passController.text);
                // }
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 40),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xffff735b),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
