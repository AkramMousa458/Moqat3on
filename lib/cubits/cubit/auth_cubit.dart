// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;

  String? password;

  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyRestPassword = GlobalKey<FormState>();

  bool termsAndConditioncheckBox = false;

  bool obscureText = true;

  toggleObscureText() {
    obscureText = !obscureText;
    emit(ObscureTextState());
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(CreateAccountLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      await verificationEmail();
      emit(CreateAccountSccessState());
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

  void termsAndConditioncheckBoxUpadte({required nValue}) {
    termsAndConditioncheckBox = nValue;
    emit(TermsAndConditionCheckBoxState());
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
}
