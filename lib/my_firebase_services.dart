import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mchmch/resources/colors.dart';
import 'package:mchmch/resources/styles.dart';

class MyFirebaseServices {
  Future<void> logout() async {
    print('Logout');
    await FacebookAuth.instance.logOut();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> writeData(dynamic data, String key) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(key);
    await ref.set(data).then((value) {
      print('data written');
    }).catchError((error) {
      print('error writing $error');
    });
  }

  Future<bool> updateData(dynamic data, String key) async {
    bool result = false;
    DatabaseReference ref = FirebaseDatabase.instance.ref(key);
    await ref.update(data).then((value) {
      print('data updated');
      result = true;
    }).catchError((error) {
      print('error updating $error');
    });
    return result;
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
      ],
    );
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> googleLogin() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    ).signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gsa.accessToken,
      idToken: gsa.idToken,
    );
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  snack(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: MyColors().primaryColor,
      content: Text(
        message,
        textAlign: TextAlign.right,
        style: MyStyles().smallNormal,
      ),
    ));
  }
}
