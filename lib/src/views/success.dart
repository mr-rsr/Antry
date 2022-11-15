import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff20a25c),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundColor: Color.fromARGB(255, 204, 203, 203),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    color: Color(0xff20a25c),
                    size: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to G10 Raj Aryan",
                  style: TextStyle(
                    fontSize: 20, //fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Entry Time: 10:00 AM",
                style: TextStyle(
                  fontSize: 15, //fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }
}
