import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/cart_page.dart';
import 'package:shoponline/src/widget/home_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black26))),
        child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black54))),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [HomeProduct(), CartPage(), Container(), Container()],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
