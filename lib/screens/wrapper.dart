import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mchmch/screens/home.dart';
import 'package:mchmch/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print('streaming user: $user');
    if (user != null) {
      if (DateTime.now().difference(user.metadata.creationTime!).inSeconds <
          2) {
        print('new user');
        return Login(newUser: true);
      }
      return Home();
    } else {
      return Login();
    }
  }
}
