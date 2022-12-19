class Original {
  int id;
  String name;
  Original(
    this.id,
    this.name,
  );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        json['id'],
        json['name'],
      );
}
