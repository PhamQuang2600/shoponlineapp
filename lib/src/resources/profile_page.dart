import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/login_page.dart';

import '../dialog/loading_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2),
      () {
        Future.delayed(const Duration(milliseconds: 2), () {
          LoadingDiaLog.showLoadingDiaLog(context, '');
          Future.delayed(const Duration(seconds: 2), () {
            LoadingDiaLog.hideDiaLog(context);
          });
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 80),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Text(
                'Pham Quang',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Text(
                '0395523926',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Text(
                'quangpham2kst@gmail.com',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Text(
                'Phuong Liet - Thanh Xuan - Ha Noi',
                style: TextStyle(fontSize: 20),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: ElevatedButton(
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 2), () {
                  LoadingDiaLog.showLoadingDiaLog(context, 'Sign out');
                  Future.delayed(const Duration(seconds: 2), () {
                    LoadingDiaLog.hideDiaLog(context);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    });
                  });
                });
              },
              child: const Text(
                'SignOut',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
