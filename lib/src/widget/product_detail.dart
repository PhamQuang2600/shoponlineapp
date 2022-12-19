import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/cart/cart_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/cart/cart_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';

import '../../bloc/product/product_bloc.dart';
import '../../models/products/products.dart';

class ProductDetail extends StatefulWidget {
  int productId;
  String name;
  ProductDetail({super.key, required this.productId, required this.name});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  GetByIdProductBloc? getProduct;
  GetRelatedProductBloc? getRelated;
  bool isExpanded = false;
  var snackBar = const SnackBar(content: Text('Add to cart success!'));
  AddToCartBloc? addToCartBloc;

  @override
  void initState() {
    super.initState();

    getProduct = BlocProvider.of<GetByIdProductBloc>(context);
    getProduct!.add(GetByIdProductEvent(widget.productId));
    getRelated = BlocProvider.of<GetRelatedProductBloc>(context);
    getRelated!.add(GetReLatedProductEvent(widget.productId));
    addToCartBloc = BlocProvider.of<AddToCartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        width: double.infinity,
        child: SizedBox(height: 50, child: addCart()),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            BlocListener<GetByIdProductBloc, ShopState>(
              listener: (context, state) {
                if (state is GetProductIdLoadingState) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetProductIdErrorState) {
                  Center(
                    child: Text(state.message),
                  );
                }
              },
              child: BlocBuilder<GetByIdProductBloc, ShopState>(
                builder: (context, state) {
                  if (state is GetProductIdLoadingState) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return (state is GetProductIdLoadedState)
                      ? GetProductId(state.getProductId)
                      : const Center(
                          child: Text('Wait, loading detail product!'));
                },
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: const Text(
                          'Product Reviews',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: 30,
                        child: Row(children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            height: 50,
                            child: const Center(
                              child: Text(
                                '4.5/5',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            height: 50,
                            child: const Center(
                              child: Text(
                                '(10 reviews)',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 40,
                        child: const Center(
                            child: Text(
                          'See All',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        height: 40,
                        child: const Center(
                            child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.red,
                          size: 18,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
              color: Colors.grey[200],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 50,
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets_image/1.jfif')),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 15),
                                  width: 340,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'PhamQuang',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.thumb_up_alt_rounded,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 5),
                                  width: 320,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: ConstrainedBox(
                          constraints: isExpanded
                              ? const BoxConstraints()
                              : const BoxConstraints(maxHeight: 70),
                          child: const Text(
                            '''Leap in battery life iPhone Pro Max marks a new turning point in battery life. With a large battery capacity combined with a new screen and power-saving Apple A15 Bionic processor, the iPhone 13 Pro Max becomes the iPhone with the best battery life ever, 2.5 hours longer than with its predecessor.
                      Unfortunately, the battery capacity of the new iPhone models has improved, but their fast charging speed still only stops at 20 W over a wired connection and charges via MagSafe at up to 15 W or can be via a charger. Qi-based wire with 7.5 W output.
                      Apple has constantly improved to give users the best product, iPhone 13 Pro Max 128GB retains the highlights of its predecessor, featuring improvements in configuration, battery life as well as camera and many more. What awaits you to discover.
                                      ''',
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    isExpanded
                        ? Container(
                            height: 30,
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                                child: const Text('Read less',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )),
                                onTap: () =>
                                    setState(() => isExpanded = false)),
                          )
                        : GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text('Read more',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),
                            ),
                            onTap: () => setState(() => isExpanded = true))
                  ]),
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: const Text(
                'Product Related',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 5,
              color: Colors.grey[200],
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 220,
                width: double.infinity,
                child: BlocListener<GetRelatedProductBloc, ShopState>(
                  listener: (context, state) {
                    if (state is GetRelatedProductLoadingState) {
                      const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetRelatedProductErrorState) {
                      Center(
                        child: Text(state.message),
                      );
                    }
                  },
                  child: BlocBuilder<GetRelatedProductBloc, ShopState>(
                    builder: (context, state) {
                      if (state is GetRelatedProductLoadingState) {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return (state is GetRelatedProductLoadedState)
                          ? builRelatedProductList(state.getRelatedProduct)
                          : const Center(
                              child: Text('Wait, loading products!'),
                            );
                    },
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 5,
              color: Colors.grey[200],
            ),
          ]),
        ),
      ),
    );
  }

  Widget GetProductId(Product product) {
    return Column(
      children: [
        Container(
          height: 10,
        ),
        SizedBox(
          height: 330,
          width: double.infinity,
          child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
              builder: (context, state) {
            if (state is GetFeaturedProductErrorState) {
              Center(
                child: Text(state.message),
              );
            }
            return (state is GetFeaturedProductLoadedState)
                ? builSlider(state.getFeaturedProduct)
                : const Center(
                    child: Text('Wait, loading products'),
                  );
          }),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 30,
          width: double.infinity,
          child: Text(
            product.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 40,
          width: double.infinity,
          child: Text(
            '\$${product.price}',
            style: const TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 30,
          width: double.infinity,
          child: const Text('\$ 1200.0',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          height: 50,
          width: double.infinity,
          child: Row(children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const Icon(
              Icons.star_half,
              color: Colors.amber,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              height: 50,
              child: const Center(
                child: Text(
                  '4.5',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5, bottom: 3),
              height: 40,
              child: const Center(
                child: Text(
                  '|',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              height: 50,
              child: const Center(
                  child: Text(
                'Sold 12',
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
            ),
          ]),
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 5),
                height: 50,
                child: const Icon(Icons.local_shipping_outlined),
              ),
              const Center(
                  child: Text(
                'Transport fee: \$1.0 - \$2.0',
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
            ],
          ),
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: const [
              Text(
                'Detail Product',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 50,
                  child: Text(
                    'Stock',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    'Original',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    'Model',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Sent from',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Text(
                    product.stock.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    product.original,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  child: Text(
                    'HaNoi, VietNam',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ]),
        Container(
          height: 5,
          color: Colors.grey[200],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 100),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        isExpanded
            ? Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                child: GestureDetector(
                    child: const Text('Read less',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                    onTap: () => setState(() => isExpanded = false)),
              )
            : Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Text('Read more',
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                    onTap: () => setState(() => isExpanded = true)),
              ),
      ],
    );
  }

  Widget builRelatedProductList(List<Product> product) {
    return GridView.count(
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      children: List.generate(product.length, (index) {
        return ListTile(
          title: Card(
            child: FeatureProduct(
                product[index].id,
                product[index].imageProduct,
                product[index].name,
                product[index].price),
          ),
          onTap: () {
            navigateToArticleDetailPage(
                context, product[index].id, product[index].name);
          },
        );
      }),
    );
  }

  Widget builSlider(List<Product> product) {
    return CarouselSlider.builder(
        itemCount: product.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets_image/${product[index].imageProduct}'))),
          );
        },
        options: CarouselOptions(
          enableInfiniteScroll: false,
        ));
  }

  void navigateToArticleDetailPage(
      BuildContext context, int productId, String name) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(
        productId: productId,
        name: name,
      );
    }));
  }

  Widget addCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocListener<AddToCartBloc, ShopState>(
          listener: (context, state) {
            if (state is AddToCartLoadingState) {
              Future.delayed(
                Duration.zero,
                () {
                  LoadingDiaLog.showLoadingDiaLog(context, "Loading");
                },
              );
            } else if (state is AddToCartLoadedState) {
              Future.delayed(
                Duration.zero,
                () {
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      LoadingDiaLog.hideDiaLog(context);
                    },
                  );
                },
              );
            } else if (state is AddToCartErrorState) {
              Center(
                child: Text(state.message),
              );
            }
          },
          child: GestureDetector(
            onTap: () {
              addToCartBloc!.add(AddtoCartEvent(widget.productId));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Center(
              child: Container(
                  height: 50,
                  width: 205,
                  color: const Color.fromARGB(255, 7, 135, 255),
                  child: const Icon(Icons.add_shopping_cart_sharp)),
            ),
          ),
        ),
        BlocListener<AddToCartBloc, ShopState>(
          listener: (context, state) {
            if (state is AddToCartLoadingState) {
              Future.delayed(
                Duration.zero,
                () {
                  LoadingDiaLog.showLoadingDiaLog(context, "Loading");
                },
              );
            } else if (state is AddToCartLoadedState) {
              Future.delayed(
                Duration.zero,
                () {
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      LoadingDiaLog.hideDiaLog(context);
                    },
                  );
                },
              );
            } else if (state is AddToCartErrorState) {
              Center(
                child: Text(state.message),
              );
            }
          },
          child: Center(
            child: GestureDetector(
              onTap: () {
                addToCartBloc!.add(AddtoCartEvent(widget.productId));
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const CartPage()));
              },
              child: Container(
                height: 50,
                width: 205,
                color: Colors.amber[900],
                child: const Center(
                  child: Text(
                    'Buy now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
