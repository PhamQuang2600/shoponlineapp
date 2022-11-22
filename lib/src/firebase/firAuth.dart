// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onLoginError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) => onSuccess())
        .catchError((err) {
      _onLoginErr(err.code, onLoginError);
    });
  }

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onSignUpError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(
          user.user!.uid, email, pass, name, phone, onSuccess, onSignUpError);
      onSuccess();
    }).catchError((err) {
      _onLoginErr(err.code, onSignUpError);
    });
  }

  _createUser(String userId, String email, String pass, String name,
      String phone, Function onSuccess, Function(String) onSignUpError) {
    var user = <String, dynamic>{};
    user = {"name": name, "phone": phone};
    var refer = FirebaseDatabase.instance.ref().child("users");
    refer.child(userId).set(user).then((value) => onSuccess).catchError((err) {
      onSignUpError("Đăng kí thất bại! Vui lòng thử lại");
    });
  }

  // void _onSignUpErr(String code, Function(String) onSignUpError) {
  //   switch (code) {
  //     case "email-already-in-use":
  //       onSignUpError("Tài khoản đâ được sử dụng!");
  //       break;
  //     case "invalid-email":
  //       onSignUpError("Tài khoản hợp lệ!");
  //       break;
  //     case "operation-not-allowed":
  //       onSignUpError("Tài khoản không được cho phép!");
  //       break;
  //     case "weak-password":
  //       onSignUpError("Mật khẩu yếu! Vui lòng nhập lại");
  //       break;
  //     default:
  //       onSignUpError("Đăng kí thất bại! Vui lòng thử lại");
  //       break;
  //   }
  // }

  void _onLoginErr(String code, Function(String) onLoginError) {
    switch (code) {
      case "invalid-email":
        onLoginError("Email không hợp lệ!");
        break;
      case "user-disabled":
        onLoginError("Tài khoản bị khóa!");
        break;
      case "user-not-found":
        onLoginError("Tài khoản không tồn tại!");
        break;
      case "wrong-password":
        onLoginError("Sai mật khẩu");
        break;
      default:
        onLoginError("Đăng nhập lỗi! Vui lòng thử lại");
        break;
    }
  }
}
