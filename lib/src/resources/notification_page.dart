import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as Badges;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Icon(
                        Icons.discount,
                        size: 30,
                        color: Colors.amber[900],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 290,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              height: 40,
                              child: Text(
                                'Promotion',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              child: Text(
                                'Promotion for you, it not bad, maybe you will need',
                                style: TextStyle(fontSize: 14),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Badges.Badge(
                          badgeContent: Center(
                            child: Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          badgeColor: Colors.red,
                        )),
                    Container(
                      height: 50,
                      child: Icon(
                        Icons.navigate_next,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Icon(
                        Icons.article_outlined,
                        size: 30,
                        color: Colors.amber[900],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 290,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              height: 40,
                              child: Text(
                                'Activities log',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              child: Text(
                                'Activity log for you, it not bad, maybe you will need',
                                style: TextStyle(fontSize: 14),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Badges.Badge(
                          badgeContent: Center(
                            child: Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          badgeColor: Colors.red,
                        )),
                    Container(
                      height: 50,
                      child: Icon(
                        Icons.navigate_next,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Order update",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Read All",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(child: Text("Label")),
                    ),
                    Container(
                      height: 80,
                      width: (MediaQuery.of(context).size.width - 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 20),
                              height: 40,
                              child: Text(
                                'Waiting payment',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 40,
                              child: Text(
                                'Promotion for you, it not bad, maybe you will need. This is a example',
                                style: TextStyle(fontSize: 14),
                                softWrap: true,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
