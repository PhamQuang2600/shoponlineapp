// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/src/dialog/loading_dialog.dart';
import 'package:shoponline/src/resources/detail_product_page.dart';
import 'package:shoponline/src/resources/new_product_page.dart';
import 'package:shoponline/src/resources/phone_category_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/resources/feature_product_page.dart';
import 'package:shoponline/src/widget/search.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2),
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
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
                    child: Carousel(
                      autoplay: true,
                      showIndicator: false,
                      boxFit: BoxFit.fitHeight,
                      autoplayDuration: const Duration(milliseconds: 6000),
                      images: const [
                        AssetImage('assets_image/1.jfif'),
                        AssetImage('assets_image/2.jfif'),
                        AssetImage('assets_image/3.jfif'),
                      ],
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
                  SizedBox(
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                                    const FeatureProductPage()));
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
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
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
                                                    const NewProductPage()));
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
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(
                            const Duration(milliseconds: 2),
                            () {
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                LoadingDiaLog.showLoadingDiaLog(context, '');
                                Future.delayed(const Duration(seconds: 2), () {
                                  LoadingDiaLog.hideDiaLog(context);
                                  Future.delayed(
                                      const Duration(milliseconds: 2), () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailProduct()));
                                  });
                                });
                              });
                            },
                          );
                        },
                        child: const Card(
                          child: SizedBox(
                              height: 240,
                              width: 170,
                              child: FeatureProduct('assets_image/1.jfif',
                                  'Xiaomi Note 10s', 500)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
