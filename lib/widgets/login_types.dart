import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mchmch/models/user_profile.dart';
import 'package:mchmch/my_firebase_services.dart';
import 'package:mchmch/widgets/login_button.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoginTypes extends StatelessWidget {
  const LoginTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: () => MyFirebaseServices()
              .signInWithFacebook()
              .then((value) => _redirectUser(value)),
          child: HeartbeatProgressIndicator(
            startScale: 1,
            endScale: 1,
            child: const LoginButton(
              icon: Icon(
                Icons.facebook,
                size: 50,
                color: Colors.blue,
              ),
              text: 'سجل بحساب فيسبوك',
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () => MyFirebaseServices()
              .googleLogin()
              .then((value) => _redirectUser(value)),
          child: HeartbeatProgressIndicator(
            startScale: 1,
            endScale: 1,
            child: LoginButton(
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 50,
                ),
                text: 'سجل بحساب جوجل'),
          ),
        )
      ],
    );
  }

  void _redirectUser(UserCredential credential) async {
    var user = credential.user;
    if (credential.additionalUserInfo!.isNewUser) {
      var p = UserProfile(
          user!.uid,
          user.email,
          user.displayName,
          credential.additionalUserInfo!.profile!['picture'],
          DateTime.now().millisecondsSinceEpoch.toString());
      MyFirebaseServices().writeData(p.toJson(), 'users/' + user.uid);
    }
  }
}
