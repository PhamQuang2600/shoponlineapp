import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isSelected = false;
  bool _isTotalSelected = false;
  int _counter = 1;
  double _price = 1000;
  double _total = 0;
  double _totalAll = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
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
                Container(
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
                  padding: EdgeInsets.only(right: 10),
                  height: 50,
                  child: Text('Total: \$$_totalAll'),
                ),
                Container(
                    height: 60,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Buy'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 224, 97, 13)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(0),
                        )),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets_image/1.jfif'))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    height: 100,
                    width: 200,
                    child: Column(children: [
                      Container(
                        height: 50,
                        width: 200,
                        child: Text(
                          'Iphone 13 pro max',
                          softWrap: true,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        child: Text(
                          '\$$_price',
                          style: TextStyle(
                              fontSize: 16, color: Colors.deepOrangeAccent),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10, right: 20),
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
                        child: Text(
                          '_',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  Container(
                    child: Text(
                      _counter.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20),
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
                        child: Text(
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
