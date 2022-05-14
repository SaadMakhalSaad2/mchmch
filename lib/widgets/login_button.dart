import 'package:flutter/material.dart';

import '../resources/styles.dart';

class LoginButton extends StatelessWidget {
  final Widget icon;
  final String text;

  const LoginButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       icon,
        Expanded(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: MyStyles().smallNormal,
        )),
      ]),
    );
  }
}
