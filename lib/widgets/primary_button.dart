import 'package:flutter/material.dart';
import 'package:mchmch/resources/colors.dart';
import 'package:mchmch/resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function() onClick;
  const PrimaryButton({Key? key, required this.onClick, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        margin: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColors().primaryColor),
        child: Text(
          text,
          style: MyStyles().medium.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
