class Category {
  int id;
  String name;
  int sortOrder;
  bool status;
  Category(
    this.id,
    this.name,
    this.sortOrder,
    this.status,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sortOrder': sortOrder,
        'status': status,
      };

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        json['id'],
        json['name'],
        json['sortOrder'],
        json['status'],
      );
}
