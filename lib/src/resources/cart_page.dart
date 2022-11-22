import 'package:flutter/material.dart';

import '../dialog/loading_dialog.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelected = false;
  bool _isTotalSelected = false;
  int _counter = 1;
  final double _price = 1000;
  double _total = 0;
  double _totalAll = 0;

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
        title: const Text('Cart'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTotalSelected = !_isTotalSelected;
                        if (_isTotalSelected) {
                          _total = _counter * _price;
                          _totalAll = _total;
                        } else {
                          _total = 0;
                          _totalAll = _total;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: _isTotalSelected
                              ? Colors.blueGrey
                              : Colors.transparent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                  width: 30,
                  child: Center(
                      child: Text(
                    'All',
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 50,
                  child: Text('Total: \$$_totalAll'),
                ),
                SizedBox(
                    height: 60,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 224, 97, 13)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        )),
                      ),
                      child: const Text('Buy'),
                    ))
              ],
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                          _isTotalSelected = !_isTotalSelected;
                          if (_isSelected) {
                            _total = _counter * _price;
                            _totalAll = _total;
                          } else {
                            _total = 0;
                            _totalAll = _total;
                          }
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
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets_image/1.jfif'))),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    height: 100,
                    width: 200,
                    child: Column(children: [
                      const SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          'Iphone 13 pro max',
                          softWrap: true,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: Text(
                          '\$$_price',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.deepOrangeAccent),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
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
                            if (_counter <= 1) {
                              _counter = 1;
                            } else if (_isSelected || _isTotalSelected) {
                              _counter--;
                              _total -= _price;
                              _totalAll = _total;
                            }
                          });
                        },
                        child: const Text(
                          '_',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  Text(
                    _counter.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!_isSelected || !_isTotalSelected) {
                              _total = 0;
                              _totalAll = _total;
                            } else {
                              _counter++;
                              _total = _counter * _price;
                              _totalAll = _total;
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
            ),
          ]),
        ),
      ),
    );
  }
}
