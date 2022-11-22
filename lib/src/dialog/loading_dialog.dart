import 'package:flutter/material.dart';

class LoadingDiaLog {
  static void showLoadingDiaLog(BuildContext context, String msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              child: SizedBox(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          msg,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ]),
              ),
            ));
  }

  static void hideDiaLog(BuildContext context) {
    Navigator.of(context).pop(LoadingDiaLog());
  }
}
