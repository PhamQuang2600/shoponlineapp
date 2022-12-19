import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/authentication/login_page.dart';

class ForgtPassPage extends StatefulWidget {
  const ForgtPassPage({super.key});

  @override
  State<ForgtPassPage> createState() => _ForgtPassPageState();
}

class _ForgtPassPageState extends State<ForgtPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: (MediaQuery.of(context).size.width - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 400,
              width: 200,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: const Text(
                'Your password will be changed to Abc@123. Are you sure?',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Your password has reset!',
                    style: TextStyle(fontSize: 16),
                  )));
                  Future.delayed(const Duration(milliseconds: 2), () {
                    LoadingDiaLog.showLoadingDiaLog(context, 'Back to Login');
                    Future.delayed(const Duration(seconds: 2), () {
                      LoadingDiaLog.hideDiaLog(context);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const LoginPage()));
                      });
                    });
                  });
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
