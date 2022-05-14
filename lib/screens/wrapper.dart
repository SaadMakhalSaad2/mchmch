import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mchmch/screens/home.dart';
import 'package:mchmch/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// FirebaseServices().signOut();
    final user = Provider.of<User?>(context);
    if (user != null) print('stream data: ${user.displayName}');

    if (user != null) {
      return Home();
    } else {
      return Login();
    }
  }
}