class RegisterModel {
  String? user;
  String? name;
  String? address;
  String? email;
  String? phone;
  String? password;
  String? confirmpassword;
  RegisterModel(
      {this.user,
      this.name,
      this.address,
      this.email,
      this.phone,
      this.password,
      this.confirmpassword});
  Map<String, dynamic> toJson() => {
        'user': user,
        'name': name,
        'address': address,
        'email': email,
        'phone': phone,
        'password': password,
        'confirmpassword': confirmpassword
      };
}
