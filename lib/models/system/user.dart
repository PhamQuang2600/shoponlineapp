class User {
  String uid;
  String account;
  String password;
  String name;
  String address;
  String phone;
  String email;
  String imageUser;
  String token;

  User(this.uid, this.name, this.account, this.address, this.email,
      this.password, this.imageUser, this.phone, this.token);

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'account': account,
        'address': address,
        'email': email,
        'password': password,
        'imageUser': imageUser,
        'phone': phone,
        'token': token
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['uid'],
        json['name'],
        json['account'],
        json['address'],
        json['email'],
        json['password'],
        json['imageUser'],
        json['phone'],
        json['token']);
  }
}
