import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
  // void writeUser(UserCredential? credentials) {
  //   User? user = credentials!.user;
  //   UserProfile profile = UserProfile(
  //       FirebaseAuth.instance.currentUser!.uid,
  //       user!.email.toString(),
  //       user.displayName.toString(),
  //       credentials.additionalUserInfo!.profile!['picture']['data']['url'],
  //       DateTime.now().millisecondsSinceEpoch.toString());

  //   var profileJson = profile.toJson();
  //   MyFirebaseServices().writeData(profileJson, 'users/${profile.id}');
  // }
}
