import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/cart_page.dart';
import 'package:shoponline/src/resources/notification_page.dart';
import 'package:shoponline/src/resources/profile_page.dart';
import 'package:shoponline/src/widget/home_product.dart';
// ignore: library_prefixes
import 'package:badges/badges.dart' as Badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  int count = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black26))),
        child: TabBar(
            controller: _tabController,
            indicator: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black54))),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            tabs: [
              const Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                  icon: (count > 0)
                      ? Badges.Badge(
                          position:
                              const Badges.BadgePosition(start: 15, bottom: 5),
                          badgeContent: Text("$count"),
                          badgeColor: Colors.red,
                          child: const Icon(Icons.shopping_cart),
                        )
                      : const Icon(Icons.shopping_cart)),
              Tab(
                  icon: (count > 0)
                      ? Badges.Badge(
                          position:
                              const Badges.BadgePosition(start: 15, bottom: 5),
                          badgeContent: Text("$count"),
                          badgeColor: Colors.red,
                          child: const Icon(Icons.notifications),
                        )
                      : const Icon(Icons.notifications)),
              const Tab(
                icon: Icon(Icons.person),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeProduct(),
          CartPage(),
          NotificationPage(),
          ProfilePage()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
