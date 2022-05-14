import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mchmch/widgets/login_button.dart';

import '../resources/styles.dart';

class LoginTypes extends StatelessWidget {
  const LoginTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        const LoginButton(
          icon: Icon(
            Icons.facebook,
            size: 50,
            color: Colors.blue,
          ),
          text: 'سجل بحساب فيسبوك',
        ),
        const SizedBox(
          height: 8,
        ),
        LoginButton(
            icon: Image.asset('assets/images/google.png', height: 50,),
            text: 'سجل بحساب جوجل')
      ],
    );
  }
}
