import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/cart/cart_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/bloc/user/user_bloc.dart';
import 'package:shoponline/src/resources/cart/payment_page.dart';

import '../../../models/cart/cart.dart';
import '../../dialog/loading_dialog.dart';
import '../authentication/login_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelected = false;
  GetAllCartBloc? getCart;
  GetByIdCartBloc? getByIdCart;
  DeleteCartBloc? deleteCart;
  UpdatedCartBloc? updatedCartBloc;
  GetUserBloc? getUser;
  var productId;
  var cartId;
  var numberProduct;

  @override
  void initState() {
    super.initState();
    getCart = BlocProvider.of<GetAllCartBloc>(context);
    getCart!.add(GetAllCartEvent());
    getByIdCart = BlocProvider.of<GetByIdCartBloc>(context);
    deleteCart = BlocProvider.of<DeleteCartBloc>(context);
    updatedCartBloc = BlocProvider.of<UpdatedCartBloc>(context);
    getUser = BlocProvider.of<GetUserBloc>(context);
    getUser!.add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllCartBloc, ShopState>(listener: (context, state) {
      if (state is GetAllCartLoadingState) {
      } else if (state is GetAllCartErrorState) {
        Center(
          child: Text(state.message),
        );
      } else if (state is GetAllCartLoadedState) {}
    }, child: BlocBuilder<GetAllCartBloc, ShopState>(
      builder: (context, state) {
        if (state is GetAllCartLoadingState) {}
        return (state is GetAllCartLoadedState)
            ? buildAllCart(state.getAllCart)
            : getUserNull();
      },
    ));
  }

  Widget buildAllCart(List<Cart> cart) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.grey,
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.only(left: 20),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(children: [
                  SizedBox(
                      height: 60,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_isSelected) {
                            updatedCartBloc!.add(UpdateCartEvent(
                                productId, cartId, numberProduct));
                            Future.delayed(Duration.zero, () {
                              LoadingDiaLog.showLoadingDiaLog(context, '');
                              Future.delayed(const Duration(seconds: 2), () {
                                LoadingDiaLog.hideDiaLog(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        PaymentPage(productId, cartId)));
                              });
                            });
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 224, 97, 13)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                        ),
                        child: const Text('Buy'),
                      ))
                ])
              ],
            )),
        body: SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: List.generate(
                      cart.length,
                      (index) {
                        productId = cart[index].productId;
                        cartId = cart[index].id;
                        return productCart(cart[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget productCart(Cart cart) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: _isSelected
                              ? Colors.blueGrey
                              : Colors.transparent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 100,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets_image/${cart.productImage}'))),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  height: 100,
                  width: 200,
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: Text(
                        cart.productName,
                        softWrap: true,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: Text(
                        '\$${cart.productPrice}',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.deepOrangeAccent),
                      ),
                    )
                  ]),
                ),
                //delete cart
                deleteCartProduct(cart.id)
              ],
            ),
          ),
          //update cart
          updateCartProduct(cart)
        ]),
      ),
    );
  }

  Widget noProductInCart() {
    return const Center(
      child: Text('There are no products in the cart'),
    );
  }

  Widget deleteCartProduct(int cartId) {
    return BlocListener<DeleteCartBloc, ShopState>(
      listener: (context, state) {
        if (state is DeleteCartLoadingState) {
        } else if (state is DeleteCartLoadedState) {
        } else if (state is DeleteCartErrorState) {
          Center(
            child: Text(state.message),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          deleteCart!.add(DeleteProductEvent(cartId));
          Future.delayed(
            Duration.zero,
            () {
              LoadingDiaLog.showLoadingDiaLog(context, "Loading");
            },
          );

          Future.delayed(
            const Duration(seconds: 2),
            () {
              LoadingDiaLog.hideDiaLog(context);
            },
          );
        },
        child: Container(
          height: 50,
          width: 30,
          padding: const EdgeInsets.only(right: 10),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

  Widget updateCartProduct(Cart cart) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 10, right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_isSelected) {
                      cart.numberProduct--;
                      if (cart.numberProduct <= 1) {
                        cart.numberProduct = 1;
                      }
                      numberProduct = cart.numberProduct;
                    }
                  });
                },
                child: const Text(
                  '_',
                  style: TextStyle(fontSize: 16),
                ),
              )),
          Text(
            cart.numberProduct.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_isSelected) {
                      cart.numberProduct++;
                      numberProduct = cart.numberProduct;
                    }
                  });
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 16),
                ),
              ))
        ],
      ),
    );
  }

  Widget getUserNull() {
    return Center(
      child: BlocListener<GetUserBloc, ShopState>(
        listener: (context, state) {
          if (state is GetUserLoadingState) {
          } else if (state is GetUserErrorState) {
            Center(
              child: Text(state.message),
            );
          }
        },
        child: BlocBuilder<GetUserBloc, ShopState>(
          builder: (context, state) {
            if (state is GetUserLoadingState) {}
            return (state is GetUserLoadedState)
                ? noProductInCart()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign in to continue payment',
                        style: TextStyle(fontSize: 20),
                      ),
                      Center(
                        child: GestureDetector(
                            onTap: () {
                              LoadingDiaLog.showLoadingDiaLog(
                                  context, 'Go to Login');
                              Future.delayed(Duration.zero, () {
                                LoadingDiaLog.hideDiaLog(context);
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const LoginPage()));
                                });
                              });
                            },
                            child: const Text('Go to Login',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue))),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
