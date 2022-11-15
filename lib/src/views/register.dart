import 'package:antry/src/extensions/class_detail.dart';
import 'package:antry/src/views/login.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import '../components/tField.dart';

class Register extends StatefulWidget {
  const Register({super.key});
//color(0xfff2735b) orangered
//color(0xffe6e6e6)
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final rollIdController = TextEditingController();
  late SingleValueDropDownController courseController;
  late SingleValueDropDownController branchController;
  late SingleValueDropDownController semesterController;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() => setState(() {}));
    rollIdController.addListener(() => setState(() {}));
    firstNameController.addListener(() => setState(() {}));
    lastNameController.addListener(() => setState(() {}));
    courseController = SingleValueDropDownController();
    branchController = SingleValueDropDownController();
    semesterController = SingleValueDropDownController();
  }
   final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        children: <Widget>[
          const SizedBox(height: 80),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: SizedBox(
              height: 200,
              child: Image(
                image: AssetImage('assets/images/signup.jpg'),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Register",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  Tfield(
                    controller: firstNameController,
                    label: "First Name",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Tfield(
                    controller: lastNameController,
                    label: "Last Name",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Tfield(
                    controller: phoneController,
                    label: "Phone Number",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Tfield(
                    controller: rollIdController,
                    label: "Roll Id",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    child: DropDownTextField(
                      textFieldDecoration: InputDecoration(
                        labelText: "Course",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 128, 127, 127),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: courseController,
                      clearOption: false,
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownIconProperty: IconProperty(
                          size: 30,
                          color: const Color.fromARGB(255, 128, 127, 127)),
                      dropDownItemCount: 4,
                      dropDownList: courseList,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: DropDownTextField(
                            textFieldDecoration: InputDecoration(
                              labelText: "Branch",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 128, 127, 127),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: branchController,
                            clearOption: false,
                            validator: (value) {
                              if (value == null) {
                                return "Required field";
                              } else {
                                return null;
                              }
                            },
                            dropDownIconProperty: IconProperty(
                                size: 30,
                                color: const Color.fromARGB(255, 128, 127, 127)),
                            dropDownItemCount: 4,
                            dropDownList: branchList,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 55,
                          child: DropDownTextField(
                            textFieldDecoration: InputDecoration(
                              labelText: "Semester",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 128, 127, 127),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: semesterController,
                            clearOption: false,
                            validator: (value) {
                              if (value == null) {
                                return "Required field";
                              } else {
                                return null;
                              }
                            },
                            dropDownIconProperty: IconProperty(
                                size: 30,
                                color: const Color.fromARGB(255, 128, 127, 127)),
                            dropDownItemCount: 4,
                            dropDownList: semesterList,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                        "Register",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already registered?",
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
                                builder: (context) => const Login(),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "Login",
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
