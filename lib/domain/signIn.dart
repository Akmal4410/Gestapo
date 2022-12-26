import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn {
  ////////////////////////////////FACEBOOK SIGNIN/////////////////////////////
  static String email = '';

  String get getEmail {
    return email;
  }

  static Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'name'],
    );

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    var userData = await FacebookAuth.instance.getUserData();
    email = userData['email'];

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  /////////////////////////////GOOGLE SIGNIN//////////////////////////////////
  static final googleSignIn = GoogleSignIn();

  static GoogleSignInAccount? _user;

  GoogleSignInAccount get gUser {
    return _user!;
  }

  static Future signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
