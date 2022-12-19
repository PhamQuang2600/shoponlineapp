import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoponline/bloc/shop_event.dart';
import 'package:shoponline/models/system/user.dart';
import 'package:shoponline/src/resources/authentication/login_page.dart';

import '../../../bloc/shop_states.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../dialog/loading_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LogOutBloc? _logoutBloc;
  GetUserBloc? _getuserBloc;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _logoutBloc = BlocProvider.of<LogOutBloc>(context);
      _getuserBloc = BlocProvider.of<GetUserBloc>(context);
      _getuserBloc?.add(GetUserEvent());
    });
  }

  void _setImageFileListFromFile(XFile? value) {}

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    final int? quality = qualityController.text.isNotEmpty
        ? int.parse(qualityController.text)
        : null;

    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 50,
      maxHeight: 50,
      imageQuality: quality,
    );
    setState(() {
      _setImageFileListFromFile(pickedFile);
    });
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      {
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {}
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BlocListener<GetUserBloc, ShopState>(
        listener: (context, state) {
          if (state is GetUserLoadingState) {
            Future.delayed(
              Duration.zero,
              () {
                LoadingDiaLog.showLoadingDiaLog(context, 'Loading');
              },
            );
          } else if (state is GetUserLoadedState) {
            Future.delayed(
              Duration.zero,
              () {
                LoadingDiaLog.hideDiaLog(context);
              },
            );
          } else {
            Future.delayed(
              Duration.zero,
              () {
                LoadingDiaLog.hideDiaLog(context);
              },
            );
          }
        },
        child: BlocBuilder<GetUserBloc, ShopState>(
          builder: (context, state) {
            if (state is GetUserLoadingState) {}
            return (state is GetUserLoadedState)
                ? getUser(state.user)
                : getUserNull();
          },
        ),
      ),
    ));
  }

  Widget getUser(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                  child: user.imageUser == null
                      ? const Icon(
                          Icons.person,
                          size: 80,
                        )
                      : Image.asset('assets_image/${user.imageUser}')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 80),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white)),
                child: GestureDetector(
                  onTap: () {
                    _onImageButtonPressed(ImageSource.gallery,
                        context: context);
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            height: 50,
            width: (MediaQuery.of(context).size.width - 60),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Text(
              user.name.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            height: 50,
            width: (MediaQuery.of(context).size.width - 60),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Text(
              user.phone.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            height: 50,
            width: (MediaQuery.of(context).size.width - 60),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Text(
              user.email.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10),
            height: 50,
            width: (MediaQuery.of(context).size.width - 60),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Text(
              user.address.toString(),
              style: const TextStyle(fontSize: 20),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocListener<LogOutBloc, ShopState>(
            listener: (context, state) {
              if (state is LogOutLoadingState) {
                Future.delayed(
                  Duration.zero,
                  () {
                    LoadingDiaLog.showLoadingDiaLog(context, 'Sign Out');
                  },
                );
              } else if (state is LogOutSuccessfulState) {
                Future.delayed(Duration.zero, () {
                  LoadingDiaLog.hideDiaLog(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 1400),
                    content: Text(
                      'Success',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent),
                    )));
              }
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
              child: ElevatedButton(
                onPressed: () {
                  _logoutBloc!.add(LogOutEvent());
                },
                child: const Text(
                  'SignOut',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ]),
      ],
    );
  }

  Widget getUserNull() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign in to continue shopping',
          style: TextStyle(fontSize: 20),
        ),
        GestureDetector(
            onTap: () {
              LoadingDiaLog.showLoadingDiaLog(context, 'Go to Login');
              Future.delayed(Duration.zero, () {
                LoadingDiaLog.hideDiaLog(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                });
              });
            },
            child: const Text('Go to Login',
                style: TextStyle(fontSize: 20, color: Colors.blue)))
      ],
    );
  }
}
