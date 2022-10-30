import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ShopOnline",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black26,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black26,
            ),
          )
        ],
      ),
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
                icon: Icon(Icons.shopify),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.person),
              )
            ]),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        height: double.infinity,
        child: TabBarView(
          controller: _tabController,
          children: [
            Row(children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              )
            ]),
            Row(children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
