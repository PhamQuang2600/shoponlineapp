import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:badges/badges.dart' as Badges;
import 'package:shoponline/src/resources/notification/activity_log_page.dart';
import 'package:shoponline/src/resources/notification/promotion_notification_page.dart';

import '../../dialog/loading_dialog.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notification'),
        backgroundColor: Colors.grey,
      ),
      body: SizedBox(
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
                    GestureDetector(
                      onTap: () {
                        Future.delayed(const Duration(milliseconds: 2), () {
                          LoadingDiaLog.showLoadingDiaLog(context, '');
                          Future.delayed(const Duration(seconds: 2), () {
                            LoadingDiaLog.hideDiaLog(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const PromotionNotification()));
                          });
                        });
                      },
                      child: SizedBox(
                        height: 80,
                        width: 290,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                height: 40,
                                child: const Text(
                                  'Promotion',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                height: 40,
                                child: const Text(
                                  'Promotion for you, it not bad, maybe you will need',
                                  style: TextStyle(fontSize: 14),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Badges.Badge(
                          badgeContent: const Center(
                            child: Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          badgeColor: Colors.red,
                        )),
                    const SizedBox(
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
              onTap: () {
                Future.delayed(const Duration(milliseconds: 2), () {
                  LoadingDiaLog.showLoadingDiaLog(context, '');
                  Future.delayed(const Duration(seconds: 2), () {
                    LoadingDiaLog.hideDiaLog(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ActivityLog()));
                  });
                });
              },
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
                    SizedBox(
                      height: 80,
                      width: 290,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              height: 40,
                              child: const Text(
                                'Activities log',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 40,
                              child: const Text(
                                'Activity log for you, it not bad, maybe you will need',
                                style: TextStyle(fontSize: 14),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Badges.Badge(
                          badgeContent: const Center(
                            child: Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          badgeColor: Colors.red,
                        )),
                    const SizedBox(
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Order update",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Read All",
                      style: TextStyle(fontSize: 16),
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
                      child: const Center(child: Text("Label")),
                    ),
                    SizedBox(
                      height: 80,
                      width: (MediaQuery.of(context).size.width - 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              height: 40,
                              child: const Text(
                                'Waiting payment',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 40,
                              child: const Text(
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
