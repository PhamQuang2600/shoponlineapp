import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/cart/cart_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/resources/cart/cart_page.dart';
import 'package:shoponline/src/resources/notification/notification_page.dart';
import 'package:shoponline/src/resources/authentication/profile_page.dart';
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
  GetAllCartBloc? getCart;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    getCart = BlocProvider.of<GetAllCartBloc>(context);
    getCart!.add(GetAllCartEvent());
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
                  icon: BlocListener<GetAllCartBloc, ShopState>(
                      listener: (context, state) {
                if (state is GetAllCartLoadingState) {
                } else if (state is GetAllCartErrorState) {
                  Center(
                    child: Text(state.message),
                  );
                }
              }, child: BlocBuilder<GetAllCartBloc, ShopState>(
                builder: (context, state) {
                  if (state is GetAllCartLoadingState) {}
                  return (state is GetAllCartLoadedState)
                      ? Badges.Badge(
                          position:
                              const Badges.BadgePosition(start: 15, bottom: 5),
                          badgeContent:
                              Text(state.getAllCart.length.toString()),
                          badgeColor: Colors.red,
                          child: const Icon(Icons.shopping_cart),
                        )
                      : const Icon(Icons.shopping_cart);
                },
              ))),
              Tab(
                  icon: Badges.Badge(
                position: const Badges.BadgePosition(start: 15, bottom: 5),
                badgeContent: const Text("1"),
                badgeColor: Colors.red,
                child: const Icon(Icons.notifications),
              )),
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
