import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/orignal_phone_page.dart';
import 'package:shoponline/src/widget/feature_product.dart';
import 'package:shoponline/src/widget/search.dart';

import '../dialog/loading_dialog.dart';

class PhoneCategoryPage extends StatefulWidget {
  const PhoneCategoryPage({super.key});

  @override
  State<PhoneCategoryPage> createState() => _PhoneCategoryPageState();
}

class _PhoneCategoryPageState extends State<PhoneCategoryPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
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
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: false,
                itemBuilder: (context, index) {
                  return Row(
                    children: const [
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'New Product',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    children: const [
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                      Card(
                        child: SizedBox(
                            height: 240,
                            width: 170,
                            child: FeatureProduct(
                                'assets_image/1.jfif', 'Xiaomi Note 10s', 500)),
                      ),
                    ],
                  );
                },
              ),
            ),
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
                                Future.delayed(const Duration(seconds: 2), () {
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
                                    fontSize: 16, fontWeight: FontWeight.w600),
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
                                Future.delayed(const Duration(seconds: 2), () {
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
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                    Card(
                      child: FeatureProduct(
                          'assets_image/1.jfif', 'Xiaomi Note 10s', 500),
                    ),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
