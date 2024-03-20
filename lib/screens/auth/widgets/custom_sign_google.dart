// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scanner/helper/colors.dart';

class CustomSignWithGoogle extends StatelessWidget {
  const CustomSignWithGoogle({
    super.key,
  });

  Future<UserCredential?> signInWithGoogle() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    // Handle FirebaseAuth-specific errors
    print('Firebase Auth Error: ${e.message}');
    return null; // or rethrow; depending on how you want to handle the error
  } on PlatformException catch (e) {
    // Handle GoogleSignIn-specific errors
    if (e.code == 'sign_in_failed') {
      print('Google Sign-In Failed');
    }
    return null; // or rethrow; depending on how you want to handle the error
  } catch (error) {
    // Handle generic errors
    print('Error: $error');
    return null; // or rethrow; depending on how you want to handle the error
  }
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await signInWithGoogle();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 18),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              width: 22,
            ),
            const SizedBox(
              width: 14,
            ),
            const Text(
              'Sign In with Google ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
