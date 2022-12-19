import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/cart/cart_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/bloc/user/user_bloc.dart';
import 'package:shoponline/src/resources/home.dart';
import '../../../models/cart/cart.dart';
import '../../../models/system/user.dart';
import '../../dialog/loading_dialog.dart';

class PaymentPage extends StatefulWidget {
  int productId;
  int cartId;
  PaymentPage(this.productId, this.cartId, {super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GetUserBloc? getUser;
  GetByIdCartBloc? getCart;
  @override
  void initState() {
    super.initState();
    getUser = BlocProvider.of<GetUserBloc>(context);
    getCart = BlocProvider.of<GetByIdCartBloc>(context);
    getUser!.add(GetUserEvent());
    getCart!.add(GetByIdCartEvent(widget.cartId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.orange[800]),
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 60,
            width: 100,
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 224, 97, 13)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
              ),
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 2), () {
                  LoadingDiaLog.showLoadingDiaLog(context, 'Ordering...');

                  Future.delayed(const Duration(milliseconds: 2000), () {
                    LoadingDiaLog.showLoadingDiaLog(
                        context, 'Order success.\nContinue shopping now!');
                    Future.delayed(const Duration(milliseconds: 2500), () {
                      LoadingDiaLog.hideDiaLog(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Home()));
                    });
                  });
                });
              },
              child: const Text(
                'Order',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ]),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              child: BlocListener<GetByIdCartBloc, ShopState>(
                listener: (context, state) {
                  if (state is GetByIdCartCartLoadingState) {
                  } else if (state is GetByIdCartCartErrorState) {
                    Center(
                      child: Text(state.message),
                    );
                  }
                },
                child: BlocBuilder<GetByIdCartBloc, ShopState>(
                  builder: (context, state) {
                    if (state is GetByIdCartCartLoadingState) {}
                    return (state is GetByIdCartCartLoadedState)
                        ? cartDetail(state.getByIdCart)
                        : const Center(
                            child: Text(""),
                          );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget userDetail(User user) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(bottom: 10, left: 50),
      child: Text("${user.name} | ${user.phone}\n" "${user.address}",
          style: const TextStyle(fontSize: 14), softWrap: true),
    );
  }

  Widget cartDetail(Cart cart) {
    var total = cart.total + (cart.feeShipping != null ? cart.feeShipping : 0);
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(
                Icons.location_on_outlined,
                color: Color.fromARGB(255, 247, 99, 1),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: const Text(
                'Delivery address',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
        BlocListener<GetUserBloc, ShopState>(
          listener: (context, state) {
            if (state is GetUserLoadingState) {
            } else if (state is GetUserErrorState) {
              Center(
                child: Text(state.message),
              );
            }
          },
          child: BlocBuilder<GetUserBloc, ShopState>(builder: (context, state) {
            if (state is GetUserLoadingState) {}
            return (state is GetUserLoadedState)
                ? userDetail(state.user)
                : const Center(
                    child: Text('null'),
                  );
          }),
        ),
        Container(
          color: Colors.grey[300],
          height: 5,
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Image.asset('assets_image/${cart.productImage}'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      cart.productName,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '\$${cart.productPrice}',
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Container(
                height: 100,
                width: (MediaQuery.of(context).size.width - 240),
                alignment: Alignment.bottomRight,
                child: Text(
                  'x${cart.numberProduct}',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          color: Colors.blue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Transport',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 101, 184, 252)),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child:
                        const Text('Express', style: TextStyle(fontSize: 15)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                        '\$${cart.feeShipping != null ? cart.feeShipping : 0}',
                        style: const TextStyle(fontSize: 15)),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Received in 30 Nov',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.blue[300],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Total Payment:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              '\$$total',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 247, 99, 1),
              ),
            )
          ]),
        ),
        Container(
          height: 10,
          color: Colors.grey[300],
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 50,
            child: const Icon(
              Icons.paid_outlined,
              color: Color.fromARGB(255, 247, 99, 1),
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 70),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Payment Method',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const Text(
                    'Payment when receive',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ]),
          ),
        ]),
        Container(
          height: 10,
          color: Colors.grey[300],
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  const Icon(
                    Icons.featured_play_list_outlined,
                    color: Color.fromARGB(255, 247, 99, 1),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Detal payment',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total amount',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '\$${cart.productPrice}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ]),
            ),
            SizedBox(
              height: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total shipping',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      '\$${cart.feeShipping != null ? cart.feeShipping : 0}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ]),
            ),
            SizedBox(
              height: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Payment',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$$total',
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 247, 99, 1)),
                    )
                  ]),
            )
          ]),
        )
      ],
    );
  }
}
