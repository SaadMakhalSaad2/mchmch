import 'package:flutter/material.dart';

import '../resources/styles.dart';

class LoginButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final EdgeInsets padding;
  final Color bgColor;

  const LoginButton({Key? key, required this.icon, required this.text, this.padding = const EdgeInsets.all(4), this.bgColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80),
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: bgColor),
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
