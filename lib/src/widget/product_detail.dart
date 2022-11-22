// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shoponline/src/resources/cart_page.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isExpanded = false;
  var snackBar = const SnackBar(content: Text('Add to cart success!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IPhone 13 Pro Max 128GB'),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () =>
                        ScaffoldMessenger.of(context).showSnackBar(snackBar),
                    child: Center(
                      child: Container(
                          height: 50,
                          width: 205,
                          color: const Color.fromARGB(255, 7, 135, 255),
                          child: const Icon(Icons.add_shopping_cart_sharp)),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 205,
                      color: Colors.amber[900],
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const CartPage())),
                        child: const Center(
                          child: Text(
                            'Buy now',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 10,
              ),
              SizedBox(
                height: 330,
                width: double.infinity,
                child: Carousel(
                  autoplay: false,
                  images: const [
                    AssetImage('assets_image/1.jfif'),
                    AssetImage('assets_image/1.jfif'),
                    AssetImage('assets_image/1.jfif'),
                    AssetImage('assets_image/1.jfif'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                height: 30,
                width: double.infinity,
                child: const Text(
                  'IPhone 13 Pro Max 128GB',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                height: 40,
                width: double.infinity,
                child: const Text(
                  '\$ 1000.0',
                  style: TextStyle(fontSize: 18, color: Colors.redAccent),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                          'Trademark',
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
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Text(
                          '100',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'Apple',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          '13 Pro Max 128GB',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
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
                    child: const Text(
                      '''iPhone 13 Pro Max 128 GB - the most anticipated super product in the second half of 2021 from Apple. The machine has a design that is not very groundbreaking when compared to its predecessor, inside this is still a product with a super beautiful screen, the refresh rate is upgraded to 120 Hz smoothly, the camera sensor has a larger size, With powerful performance and power from Apple A15 Bionic, ready to conquer any challenge with you. Top class design
The new iPhone inherits the distinctive design from the iPhone 12 Pro Max when it has a square frame, a glass back, and an overflowing notch at the front.
Super smooth entertainment screen with 120 Hz . refresh rate iPhone 13 Pro Max is equipped with a 6.7-inch screen with a resolution of 1284 x 2778 Pixels, using an OLED panel with Super Retina XDR technology for outstanding energy savings but still ensuring a sharp display. realistically alive.
This year's iPhone Pro Max has been upgraded to a 120 Hz refresh rate, all transitions when swiping fingers on the screen become smoother and the visual effects when we play games or watch videos are also extremely good. eye-catching. With intelligent ProMotion technology that can change the scan frequency from 10 to 120 times per second depending on the application and operation you are using, to optimize battery life and your experience. If you use iPhone 13 Pro Max to play games, the 120 Hz refresh rate combined with the excellent graphics performance of the GPU will make the device extremely perfect when experiencing. In addition, the device also supports True Tone technology, the wide color range of the P3 cinema standard will make your experience on the device more impressive than ever. The camera cluster has been completely upgraded. iPhone 13 Pro Max will still have a set of 3-lens cameras arranged alternately in a square cluster, located in the upper left corner of the back, including a telephoto camera, super wide-angle camera and wide-angle main camera with a super large f/1.5 aperture. . The super wide-angle camera has also been upgraded with an f/1.8 aperture, a faster sensor, delivering natural and realistic super wide-angle photos and also enhanced the ability to focus at a distance of only 2 cm, bringing to interesting macro photography and movie shooting features. The telephoto camera on iPhone 13 Pro Max can zoom 3x optically, magnify images and videos 3 times but still maintain the same quality, support portrait photography to remove fonts, built-in a lot of natural color filters to help Get the picture you want. In addition, the LiDAR sensor will still be present on the iPhone 13 Pro Max to provide the best augmented reality (AR) experience for all users as well as support for the camera cluster to focus in low light environments.  Apple also enhanced the photography capabilities on the iPhone 13 Pro Max with Cinematic movie recording mode that makes it easy for users to focus on subjects both during and after recording, while blurring the background and other characters. other objects in the frame. It's also the first smartphone to offer an "end-to-end" professional workflow that allows you to record and edit video in ProRes or Dolby Vision compressed formats with a variety of in-depth settings that make it easy to significantly shorten the post-production process to create amazing quality footage right on your own phone. Promising performance with Apple A15 Bionic iPhone 13 Pro Max will be equipped with the company's latest Apple A15 Bionic processor, manufactured on the 5 nm process, ensuring impressive performance while still saving power with the ability to support Super high speed 5G network support. According to Apple, the A15 Bionic is the fastest chipset in the smartphone world (September 2021, 50% faster than other chips on the market, able to perform 15.8 trillion operations per second, helping CPU performance is faster than ever. The machine owns 128 GB of internal memory, just enough for the needs of a basic user, without the need to record too much video, in addition this year there is also an internal memory version up to 1TB, you can can be considered if there is a high storage need. In addition, the device is also integrated with Wi-Fi 6 technology, a new wireless connection standard with equipped with multiple 5G bands, compatible with many carriers in different countries, iPhone 13 Pro Max always gives fast speed. maximum network speed, for a smooth 4K movie experience, download files in the blink of an eye, play online games without delay anywhere. Leap in battery life iPhone Pro Max marks a new turning point in battery life. With a large battery capacity combined with a new screen and power-saving Apple A15 Bionic processor, the iPhone 13 Pro Max becomes the iPhone with the best battery life ever, 2.5 hours longer than with its predecessor. Unfortunately, the battery capacity of the new iPhone models has improved, but their fast charging speed still only stops at 20 W over a wired connection and charges via MagSafe at up to 15 W or can be via a charger. Qi-based wire with 7.5 W output. Apple has constantly improved to give users the best product, iPhone 13 Pro Max 128GB retains the highlights of its predecessor, featuring improvements in configuration, battery life as well as camera and many more. What awaits you to discover. ''',
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
              isExpanded
                  ? Container(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: GestureDetector(
                          child: const Text('Read less',
                              style: TextStyle(
                                color: Colors.blue,
                              )),
                          onTap: () => setState(() => isExpanded = false)),
                    )
                  : GestureDetector(
                      child: const Text('Read more',
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                      onTap: () => setState(() => isExpanded = true)),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  '(10 reviews)',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: GestureDetector(
                                  child: const Text('Read less',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                  onTap: () =>
                                      setState(() => isExpanded = false)),
                            )
                          : GestureDetector(
                              child: const Text('Read more',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),
                              onTap: () => setState(() => isExpanded = true))
                    ]),
              )
            ]),
          ),
        ));
  }

  showOverLay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: Positioned(
                height: 400,
                width: double.infinity,
                top: 100,
                child: Container(
                  color: Colors.black,
                  child: Column(children: [
                    Row(
                      children: const [
                        SizedBox(
                          height: 50,
                          width: 50,
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ));

    overlayState.insert(overlayEntry);
    await Future.delayed(const Duration(milliseconds: 2000));
    overlayEntry.remove();
  }
}
