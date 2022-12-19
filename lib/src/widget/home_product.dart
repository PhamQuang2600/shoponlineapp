import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/product/new_product_page.dart';
import 'package:shoponline/src/resources/product/phone_category_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/resources/product/feature_product_page.dart';
import 'package:shoponline/src/widget/product_detail.dart';
import 'package:shoponline/src/widget/search.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/products/products.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  GetFeaturedProductBloc? getfeaturedproduct;
  GetLatedProductBloc? getlated;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getfeaturedproduct = BlocProvider.of<GetFeaturedProductBloc>(context);
      getfeaturedproduct!.add(GetFeaturedProductEvent());
      getlated = BlocProvider.of<GetLatedProductBloc>(context);
      getlated!.add(GetLatedProductEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 440,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchProduct(),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 200,
                  width: double.infinity,
                  child: BlocListener<GetLatedProductBloc, ShopState>(
                    listener: (context, state) {
                      if (state is GetLatestedProductLoadingState) {
                        //LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
                      } else if (state is GetLatestedProductErrorState) {
                        Center(
                          child: Text(state.message),
                        );
                      }
                    },
                    child: BlocBuilder<GetLatedProductBloc, ShopState>(
                      builder: (context, state) {
                        if (state is GetLatestedProductErrorState) {
                          Center(
                            child: Text(state.message),
                          );
                        }
                        return (state is GetLatestedProductLoadedState)
                            ? builSlider(state.getLatestedProduct)
                            : const Center(
                                child: Text('Wait, loading products!'),
                              );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                //category

                SizedBox(
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const PhoneCategoryPage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.indigoAccent,
                            maxRadius: 38,
                            child: Icon(Icons.phone_android),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const PhoneCategoryPage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            maxRadius: 38,
                            child: Icon(Icons.tablet),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const PhoneCategoryPage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.amber,
                            maxRadius: 38,
                            child: Icon(Icons.laptop),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const PhoneCategoryPage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            maxRadius: 38,
                            child: Icon(Icons.keyboard),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(Duration.zero, () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const PhoneCategoryPage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.lightGreenAccent,
                            maxRadius: 38,
                            child: Icon(Icons.headphones),
                          ),
                        ),
                      ]),
                ),
                //feature product
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Featured",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(Duration.zero, () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(
                                    context, 'Loading');
                              });
                            });
                            Future.delayed(Duration.zero, () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.hideDiaLog(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FeatureProductPage(),
                                    ));
                              });
                            });
                          },
                          child: const Text("See All",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: BlocListener<GetFeaturedProductBloc, ShopState>(
              listener: (context, state) {
                if (state is GetFeaturedProductLoadingState) {
                  Future.delayed(
                    Duration.zero,
                    () {
                      LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
                    },
                  );
                } else if (state is GetFeaturedProductLoadedState) {
                  Future.delayed(
                    Duration.zero,
                    () {
                      LoadingDiaLog.hideDiaLog(context);
                    },
                  );
                } else if (state is GetFeaturedProductErrorState) {
                  Center(
                    child: Text(state.message),
                  );
                }
              },
              child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
                  builder: (context, state) {
                if (state is GetFeaturedProductErrorState) {
                  Center(
                    child: Text(state.message),
                  );
                }
                return (state is GetFeaturedProductLoadedState)
                    ? builProductList(state.getFeaturedProduct)
                    : const Center(
                        child: Text('Wait, loading products'),
                      );
              }),
            ),
          ),
          //new product
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "New Product",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Future.delayed(Duration.zero, () {
                                  LoadingDiaLog.showLoadingDiaLog(
                                      context, 'Loading');
                                  Future.delayed(Duration.zero, () {
                                    LoadingDiaLog.hideDiaLog(context);

                                    Future.delayed(Duration.zero, () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewProductPage(),
                                          ));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: const Text("See All",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      ]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: 230,
            width: double.infinity,
            child: BlocListener<GetLatedProductBloc, ShopState>(
              listener: (context, state) {
                if (state is GetLatestedProductLoadingState) {
                  //LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
                } else if (state is GetLatestedProductErrorState) {
                  Center(
                    child: Text(state.message),
                  );
                }
              },
              child: BlocBuilder<GetLatedProductBloc, ShopState>(
                builder: (context, state) {
                  if (state is GetLatestedProductErrorState) {
                    Center(
                      child: Text(state.message),
                    );
                  }
                  return (state is GetLatestedProductLoadedState)
                      ? builProductList(state.getLatestedProduct)
                      : const Center(
                          child: Text('Wait, loading products!'),
                        );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget builProductList(List<Product> product) {
    return GridView.count(
      crossAxisCount: 1,
      scrollDirection: Axis.horizontal,
      children: List.generate(product.length, (index) {
        return GridTile(
          child: Card(
            child: GestureDetector(
              onTap: () {
                navigateToArticleDetailPage(
                    context, product[index].id, product[index].name);
              },
              child: FeatureProduct(
                  product[index].id,
                  product[index].imageProduct,
                  product[index].name,
                  product[index].price),
            ),
          ),
        );
      }),
    );
  }

  Widget builSlider(List<Product> product) {
    return CarouselSlider.builder(
        itemCount: product.length,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductDetail(
                      productId: product[index].id,
                      name: product[index].name)));
            },
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets_image/${product[index].imageProduct}'))),
            ),
          );
        },
        options: CarouselOptions(height: 300, autoPlay: true));
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
}
