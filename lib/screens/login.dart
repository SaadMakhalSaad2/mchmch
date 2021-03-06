import 'package:flutter/material.dart';
import 'package:mchmch/widgets/login_types.dart';
import 'package:mchmch/widgets/user_types.dart';
import '../resources/colors.dart';

class Login extends StatelessWidget {
  final bool newUser;
  const Login({Key? key, this.newUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().backgroundColor,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/image.png',
          height: 150,
        ),
        newUser ? UserTypes() : LoginTypes()
      ],
    );
  }
}
