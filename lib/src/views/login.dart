import 'package:antry/src/views/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
//color(0xfff2735b) orangered
//color(0xffe6e6e6)
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  bool isPassVisible = false;
  @override
  void initState() {
    super.initState();

    phoneController.addListener(() => setState(() {}));
    passController.addListener(() => setState(() {}));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        children: <Widget>[
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Image(
              image: AssetImage('assets/images/8401.jpg'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
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
                    obscureText: !isPassVisible,
                    decoration: InputDecoration(
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
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() ||
                          phoneController.text == "1234567890" ||
                          passController.text == "1234567890") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text('Processing Data'),
                        //   ),

                        // );
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 40),
                      ),
                      maximumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
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
                    height: 30,
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
            ),
          ),
        ],
      ),
    );
  }
}
