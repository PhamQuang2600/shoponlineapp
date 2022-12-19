class LoginModel {
  String? user;
  String? password;
  LoginModel({this.user, this.password});

  Map<String, dynamic> toJson() => {'user': user, 'password': password};
}
