class Cart {
  int id;
  String uid;
  int productId;
  String productName;
  double productPrice;
  String productImage;

  int numberProduct;
  double feeShipping;
  double total;
  double totalAll;
  int counterInCart;
  Cart(
      this.id,
      this.uid,
      this.productId,
      this.productName,
      this.productPrice,
      this.productImage,
      this.numberProduct,
      this.feeShipping,
      this.total,
      this.totalAll,
      this.counterInCart);

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'productId': productId,
        'productName': productName,
        'productPrice': productPrice,
        'productImage': productImage,
        'numberProduct': numberProduct,
        'feeShipping': feeShipping,
        'total': total,
        'totalAll': totalAll,
        'counterInCart': counterInCart
      };

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
      json['id'],
      json['uid'],
      json['productId'],
      json['productName'],
      json['productPrice'],
      json['productImage'],
      json['numberProduct'],
      json['feeShipping'],
      json['total'],
      json['totalAll'],
      json['counterInCart']);
}
