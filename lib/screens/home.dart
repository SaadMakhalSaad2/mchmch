import 'package:flutter/material.dart';
import 'package:mchmch/my_firebase_services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(children: [
        RaisedButton(onPressed: (() => MyFirebaseServices().logout()))
      ]),
    );
  }
}
