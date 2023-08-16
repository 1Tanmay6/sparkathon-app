// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/bottomNavBar_Screen.dart';
import '../screens/auth_Screen.dart';

class AuthServices with ChangeNotifier {
  String _uid = '';

  User? user;

  String get uid => _uid;

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gauth = await guser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    final res = await FirebaseAuth.instance.signInWithCredential(credential);

    user = res.user;
    _uid = res.user!.uid;

    if (_uid != '') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBarScreen(),
          ));
    }
    return res;
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const AuthScreen();
        },
      ),
    );
  }
}
