import 'package:flutter/material.dart';

class LoadingDialogBox {
  showDialogBox(BuildContext context, String message) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AlertDialog(
                  backgroundColor: const Color(0xffeeeded),
                  icon: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Color(0xfff2735b),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        message,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 15),
                      )
                    ],
                  )),
                )
                //title: Text("Please wait..."),
                ),
          );
        });
  }
}
