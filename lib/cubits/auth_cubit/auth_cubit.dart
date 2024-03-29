// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? userName;

  String? emailAddress;

  String? password;

  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRestPassword = GlobalKey<FormState>();

  bool obscureText = true;

  toggleObscureText() {
    obscureText = !obscureText;
    emit(ObscureTextState());
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(CreateAccountLoadingState());
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await verificationEmail();
      emit(CreateAccountSccessState());

      // Move the code that accesses userCredential inside the try block
      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email)
          .set({
        'name': userName,
        'email': emailAddress,
      });
    } on FirebaseAuthException catch (e) {
      _signUpException(e);
    } catch (e) {
      emit(CreateAccountFailureState(error: e.toString()));
    }
  }

  void _signUpException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(CreateAccountFailureState(
        error: 'The password provided is too weak.',
      ));
    } else if (e.code == 'email-already-in-use') {
      emit(CreateAccountFailureState(
        error: 'The account already exists for that email.',
      ));
    } else if (e.code == ' invalid-email') {
      emit(CreateAccountFailureState(
        error: ' The email input is invalid.',
      ));
    }
  }

  Future<void> signINWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(SignInSccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignInFailureState(
          error: 'The password provided is too weak.',
        ));
      } else {
        emit(SignInFailureState(error: 'chick your email and password'));
      }
    } catch (e) {
      emit(CreateAccountFailureState(error: e.toString()));
    }
  }

  Future<void> verificationEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> sendResetPasswordLink() async {
    try {
      emit(RestPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);

      emit(RestPasswordSccessState());
    } catch (e) {
      emit(RestPasswordFailureState(error: e.toString()));
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
