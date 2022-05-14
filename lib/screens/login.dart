import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mchmch/my_firebase_services.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
            onPressed: () async {
              MyFirebaseServices().signInWithFacebook().then((value) {
                if (value.additionalUserInfo!.isNewUser) {}
                print(value);
              });
            },
            child: const Text('Login with Facebook')),
        TextButton(
            onPressed: () async {
              _handleSignIn();
            },
            child: const Text('Login with Google'))
      ]),
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Future<void> _handleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = authResult.user;
    print('user $_user');
  }
}
