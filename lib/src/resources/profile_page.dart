import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(top: 150),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              Container(
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
                padding: EdgeInsets.only(top: 60, left: 80),
                child: Container(
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              child: Text(
                'Pham Quang',
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              child: Text(
                '0395523926',
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              child: Text(
                'quangpham2kst@gmail.com',
                style: TextStyle(fontSize: 20),
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              height: 50,
              width: (MediaQuery.of(context).size.width - 60),
              child: Text(
                'Phuong Liet - Thanh Xuan - Ha Noi',
                style: TextStyle(fontSize: 20),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
            ),
          ),
        ]),
      ),
    );
  }
}
