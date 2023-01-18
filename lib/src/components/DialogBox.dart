import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBox {
  showDialogBox(BuildContext context, String message, IconData prefixIcon) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              backgroundColor: const Color(0xffeeeded),
              icon: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    prefixIcon,
                    color: const Color(0xfff2735b),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Registration Failed",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 20),
                  )
                ],
              )),
              content: Text(
                message,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Roboto", fontSize: 15),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        color: Color(0xfff2735b),
                        fontFamily: "Roboto",
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
