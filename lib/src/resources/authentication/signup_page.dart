import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/bloc/shop_states.dart';
import 'package:shoponline/bloc/user/user_bloc.dart';
import 'package:shoponline/models/system/register_model.dart';
import 'package:shoponline/src/resources/authentication/login_page.dart';

import '../../dialog/loading_dialog.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isShowConfirm = true;
  bool isShowPassword = true;
  TextEditingController user = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  RegisterBloc? _registerBloc;
  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets_image/logoshop.jpg',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 50,
                width: 220,
                child: Center(
                  child: Text(
                    'Sign up to continue using Shop',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  controller: user,
                  decoration: const InputDecoration(
                      label: Text('User'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      label: Text('Name'),
                      prefixIcon: Icon(Icons.abc),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                      label: Text('Phone'),
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      label: Text('Email'),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: address,
                  decoration: const InputDecoration(
                      label: Text('Address'),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: password,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          child: const Icon(Icons.remove_red_eye)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                height: 70,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: confirmpassword,
                  obscureText: isShowConfirm,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isShowConfirm = !isShowConfirm;
                            });
                          },
                          child: const Icon(Icons.remove_red_eye)),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              BlocListener<RegisterBloc, ShopState>(
                listener: (context, state) {
                  if (state is RegisterLoadingState) {
                    LoadingDiaLog.showLoadingDiaLog(context, 'Sign Up');
                  } else if (state is RegisterLoadedState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'Sign up success!',
                      style: TextStyle(fontSize: 16),
                    )));
                    Future.delayed(const Duration(milliseconds: 2), () {
                      LoadingDiaLog.showLoadingDiaLog(context, 'Back to Login');
                      Future.delayed(const Duration(seconds: 2), () {
                        LoadingDiaLog.hideDiaLog(context);
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const LoginPage()));
                        });
                      });
                    });
                  } else {
                    Future.delayed(const Duration(seconds: 2), () {
                      LoadingDiaLog.hideDiaLog(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'Please, enter correct field!',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent),
                      )));
                    });
                  }
                },
                child: Container(
                    height: 70,
                    width: (MediaQuery.of(context).size.width - 50),
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          RegisterModel models = RegisterModel(
                              user: user.text,
                              name: name.text,
                              address: address.text,
                              email: email.text,
                              phone: phone.text,
                              password: password.text,
                              confirmpassword: confirmpassword.text);
                          _registerBloc!.add(RegisterEvent(model: models));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ))),
              ),
              Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 50),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a user? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 2), () {
                            LoadingDiaLog.showLoadingDiaLog(
                                context, 'Go to Login');
                            Future.delayed(const Duration(seconds: 2), () {
                              LoadingDiaLog.hideDiaLog(context);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const LoginPage()));
                              });
                            });
                          });
                        },
                        child: const Text(
                          'Login now',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
