import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoponline/models/system/login_model.dart';
import 'package:shoponline/src/resources/authentication/forgot_password_page.dart';
import 'package:shoponline/src/resources/authentication/signup_page.dart';

import '../../../bloc/shop_event.dart';
import '../../../bloc/shop_states.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../dialog/loading_dialog.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPass = true;
  bool isColor = false;
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthenticateBloc? _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthenticateBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        constraints: const BoxConstraints.expand(),
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                width: 200,
              ),
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
                    'Login to continue using Shop',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: 80,
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
                height: 80,
                width: (MediaQuery.of(context).size.width - 50),
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  controller: password,
                  obscureText: isShowPass,
                  decoration: InputDecoration(
                      label: const Text('Password'),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isShowPass = !isShowPass;
                              isColor = !isColor;
                            });
                          },
                          child: const Icon(
                            Icons.remove_red_eye,
                            //color: isColor ? Colors.blue : Colors.grey,
                          )),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                ),
              ),
              Container(
                  height: 40,
                  width: (MediaQuery.of(context).size.width - 50),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: GestureDetector(
                    onTap: () {
                      Future.delayed(
                        const Duration(milliseconds: 2),
                        () {
                          Future.delayed(const Duration(milliseconds: 2), () {
                            LoadingDiaLog.showLoadingDiaLog(context, '');
                            Future.delayed(const Duration(seconds: 2), () {
                              LoadingDiaLog.hideDiaLog(context);
                              Future.delayed(const Duration(milliseconds: 2),
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const ForgtPassPage()));
                              });
                            });
                          });
                        },
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )),
              BlocListener<AuthenticateBloc, ShopState>(
                listener: (context, state) {
                  if (state is AuthenticateLoadingState) {
                    LoadingDiaLog.showLoadingDiaLog(context, 'Login');
                  } else if (state is AuthenticateSuccessfulState) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const Home()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 1400),
                        content: Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent),
                        )));
                  } else {
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      LoadingDiaLog.hideDiaLog(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 1400),
                          content: Text(
                            "Please, enter correct user and password",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent),
                          )));
                    });
                  }
                },
                child: Container(
                    height: 60,
                    width: (MediaQuery.of(context).size.width - 50),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          LoginModel models = LoginModel(
                              user: user.text, password: password.text);
                          _authBloc!.add(AuthenticateEvent(model: models));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
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
                        'New user? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 2), () {
                            LoadingDiaLog.showLoadingDiaLog(context, '');
                            Future.delayed(const Duration(seconds: 2), () {
                              LoadingDiaLog.hideDiaLog(context);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const SignUpPage()));
                              });
                            });
                          });
                        },
                        child: const Text(
                          'Sign up for a new account',
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
