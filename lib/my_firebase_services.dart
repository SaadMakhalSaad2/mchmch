import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User?> googleLogin() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    ).signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? _user = authResult.user;
    return _user;
    print('user $_user');
  }
}
