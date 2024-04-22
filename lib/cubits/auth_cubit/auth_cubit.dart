import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
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
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await verificationEmail();

      _firestore.collection('users').doc(userCredential.user!.email).set(
        {
          'name': userName,
          'email': emailAddress,
          'image':
              'https://i.guim.co.uk/img/media/5d9ea77d27c95d327caee787ddc6af484faaa567/0_0_8192_5464/master/8192.jpg?width=1300&dpr=1&s=none'
        },
      );
      emit(CreateAccountSccessState());

      // Move the code that accesses userCredential inside the try block
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
      await _auth.signInWithEmailAndPassword(
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
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<void> sendResetPasswordLink() async {
    try {
      emit(RestPasswordLoadingState());
      await _auth.sendPasswordResetEmail(email: emailAddress!);

      emit(RestPasswordSccessState());
    } catch (e) {
      emit(RestPasswordFailureState(error: e.toString()));
    }
  }

  Future signInWithGoogle() async {
    emit(SignInGoogleLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithProvider(googleAuthProvider);

      _firestore.collection('users').doc(userCredential.user!.email).set({
        'name': userCredential.user!.displayName ??
            userCredential.user!.email!.split('@')[0],
        'email': userCredential.user!.email,
        'image': userCredential.user!.photoURL ??
            'https://i.guim.co.uk/img/media/5d9ea77d27c95d327caee787ddc6af484faaa567/0_0_8192_5464/master/8192.jpg?width=1300&dpr=1&s=none'
      });

      emit(SignInGoogleSccessState());
      } on FirebaseAuthException catch (e) {
        _googleSignInException(e);
    } catch (e) {
      emit(SignInGoogleFailureState(error: e.toString()));
    }
  }

  void _googleSignInException(FirebaseAuthException e) {
    if (e.code == 'user-disabled') {
      emit(SignInGoogleFailureState(
        error: 'The User in disabled',
      ));
    } else if (e.code == 'web-context-canceled') {
      emit(SignInGoogleFailureState(
        error: 'Google sign in cancled by user',
      ));
    } else if (e.code == ' invalid-email') {
    } else if (e.code == 'email-already-in-use') {
      emit(SignInGoogleFailureState(
        error: 'The account already exists for that email.',
      ));
    } else if (e.code == ' invalid-email') {
      emit(SignInGoogleFailureState(
        error: ' The email input is invalid.',
      ));
    }
  }

  void skipUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isSkiped', true);
  }

  Future<bool> getSkip() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isSkiped') ?? false;
  }
}
