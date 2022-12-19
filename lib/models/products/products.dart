class Product {
  int id;
  String name;
  String description;
  double price;
  String createdDate;
  String catgory;
  String original;
  int stock;
  String imageProduct;
  Product(this.id, this.name, this.description, this.price, this.stock,
      this.createdDate, this.catgory, this.original, this.imageProduct);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['id'],
        json['name'],
        json['description'],
        json['price'],
        json['stock'],
        json['createdDate'],
        json['category'],
        json['original'],
        json['imageProduct']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'createdDate': createdDate,
        'stock': stock,
        'imageProduct': imageProduct,
        'original': original,
        'category': catgory,
      };
}
