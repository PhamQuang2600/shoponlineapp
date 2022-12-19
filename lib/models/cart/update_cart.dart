class UpdateCart {
  String uid;
  int productId;
  int cartId;
  int numberProduct;
  double? feeShipping;
  UpdateCart(
      {required this.uid,
      required this.productId,
      required this.cartId,
      required this.numberProduct,
      this.feeShipping});
}
