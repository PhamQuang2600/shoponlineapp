import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/product/product_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/src/resources/product/orignal_phone_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../../../models/products/products.dart';
import '../../dialog/loading_dialog.dart';
import '../../widget/product_detail.dart';

class PhoneCategoryPage extends StatefulWidget {
  const PhoneCategoryPage({super.key});

  @override
  State<PhoneCategoryPage> createState() => _PhoneCategoryPageState();
}

class _PhoneCategoryPageState extends State<PhoneCategoryPage> {
  GetFeaturedProductBloc? getFeaturedProductBloc;
  GetLatedProductBloc? getLatedProductBloc;
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        Future.delayed(const Duration(milliseconds: 2), () {
          LoadingDiaLog.showLoadingDiaLog(context, '');
          Future.delayed(const Duration(seconds: 2), () {
            LoadingDiaLog.hideDiaLog(context);
          });
        });
      },
    );

    super.initState();
    getFeaturedProductBloc = BlocProvider.of<GetFeaturedProductBloc>(context);
    getLatedProductBloc = BlocProvider.of<GetLatedProductBloc>(context);
    getFeaturedProductBloc!.add(GetFeaturedProductEvent());
    getLatedProductBloc!.add(GetLatedProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Phone'),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 70,
                padding: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: const SearchProduct(),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Featured Product',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                  height: 230,
                  child: BlocListener<GetFeaturedProductBloc, ShopState>(
                    listener: (context, state) {
                      if (state is GetFeaturedProductLoadingState) {
                      } else if (state is GetFeaturedProductErrorState) {
                        Center(
                          child: Text(state.message),
                        );
                      }
                    },
                    child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
                      builder: (context, state) {
                        if (state is GetFeaturedProductLoadingState) {}
                        return (state is GetFeaturedProductLoadedState)
                            ? builProductList(state.getFeaturedProduct)
                            : const Center(
                                child: Text('Error'),
                              );
                      },
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'New Product',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                  height: 230,
                  child: BlocListener<GetLatedProductBloc, ShopState>(
                    listener: (context, state) {
                      if (state is GetLatestedProductLoadingState) {
                      } else if (state is GetLatestedProductErrorState) {
                        Center(
                          child: Text(state.message),
                        );
                      }
                    },
                    child: BlocBuilder<GetLatedProductBloc, ShopState>(
                      builder: (context, state) {
                        if (state is GetLatestedProductLoadingState) {}
                        return (state is GetLatestedProductLoadedState)
                            ? builProductList(state.getLatestedProduct)
                            : const Center(
                                child: Text('Error'),
                              );
                      },
                    ),
                  )),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              Future.delayed(
                                const Duration(milliseconds: 2),
                                () {
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    LoadingDiaLog.showLoadingDiaLog(
                                        context, '');
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 2), () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const OriginalPhonePage()));
                                      });
                                    });
                                  });
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.amber,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'SamSung',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Future.delayed(
                                const Duration(milliseconds: 2),
                                () {
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    LoadingDiaLog.showLoadingDiaLog(
                                        context, '');
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 2), () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const OriginalPhonePage()));
                                      });
                                    });
                                  });
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.amber,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Apple',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Future.delayed(
                                const Duration(milliseconds: 2),
                                () {
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    LoadingDiaLog.showLoadingDiaLog(
                                        context, '');
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 2), () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const OriginalPhonePage()));
                                      });
                                    });
                                  });
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.amber,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Xiaomi',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Future.delayed(
                                const Duration(milliseconds: 2),
                                () {
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    LoadingDiaLog.showLoadingDiaLog(
                                        context, '');
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 2), () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const OriginalPhonePage()));
                                      });
                                    });
                                  });
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.amber,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Vivo',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Future.delayed(
                                const Duration(milliseconds: 2),
                                () {
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    LoadingDiaLog.showLoadingDiaLog(
                                        context, '');
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 2), () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const OriginalPhonePage()));
                                      });
                                    });
                                  });
                                },
                              );
                            },
                            child: Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                margin: const EdgeInsets.only(left: 5),
                                color: Colors.amber,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Mobiistar',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    height: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              const Duration(milliseconds: 2),
                              () {
                                Future.delayed(const Duration(milliseconds: 2),
                                    () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(
                                        const Duration(milliseconds: 2), () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const OriginalPhonePage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: Container(
                              height: 40,
                              color: Colors.amber,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin: const EdgeInsets.only(left: 5),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Oppo',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(
                              const Duration(milliseconds: 2),
                              () {
                                Future.delayed(const Duration(milliseconds: 2),
                                    () {
                                  LoadingDiaLog.showLoadingDiaLog(context, '');
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Future.delayed(
                                        const Duration(milliseconds: 2), () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const OriginalPhonePage()));
                                    });
                                  });
                                });
                              },
                            );
                          },
                          child: Container(
                              height: 40,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin: const EdgeInsets.only(left: 5),
                              color: Colors.amber,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'VinSmart',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: BlocListener<GetFeaturedProductBloc, ShopState>(
                      listener: (context, state) {
                        if (state is GetFeaturedProductLoadingState) {
                        } else if (state is GetFeaturedProductErrorState) {
                          Center(
                            child: Text(state.message),
                          );
                        }
                      },
                      child: BlocBuilder<GetFeaturedProductBloc, ShopState>(
                        builder: (context, state) {
                          if (state is GetFeaturedProductLoadingState) {}
                          return (state is GetFeaturedProductLoadedState)
                              ? buildProductList(state.getFeaturedProduct)
                              : const Center(
                                  child: Text('Error'),
                                );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
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

  void navigateToArticleDetailPage(
      BuildContext context, int productId, String name) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetail(
        productId: productId,
        name: name,
      );
    }));
  }

  Widget buildProductList(List<Product> product) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(product.length, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                navigateToArticleDetailPage(
                    context, product[index].id, product[index].name);
              },
              child: Container(
                //decoration: BoxDecoration(border: Border.all(width: 1)),
                child: FeatureProduct(
                    product[index].id,
                    product[index].imageProduct,
                    product[index].name,
                    product[index].price),
              ),
            ),
          );
        }));
  }
}
