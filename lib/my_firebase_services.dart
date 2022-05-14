
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class MyFirebaseServices {
  Future<void> logout() async {
    print('Logout');
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> writeData(dynamic data, String key) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(key);
    await ref.set(data).then((value) => {print('data written')});
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

  // Future<UserProfile>? downloadProfile() async {
  //   DatabaseReference ref = FirebaseDatabase.instance
  //       .ref('users/${FirebaseAuth.instance.currentUser!.uid}');
  //   DatabaseEvent event = await ref.once();
  //   UserProfile p =
  //       UserProfile.fromJson(event.snapshot.value as Map<Object?, Object?>);
  //   return p;
  // }

  
}