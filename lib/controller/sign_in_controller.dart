import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac2/bloc/sign_in_bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          print("email empty");
        } else {}
        if (password.isEmpty) {
          print("password empty");
        } else {}
        try {
          final check = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress, password: password);
          if (check.user == null) {}
          if (!check.user!.emailVerified) {}
          var user = check.user;
          if (user != null) {
            ///got user from firebase
          } else {
            ///probl
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user find");
          } else if (e.code == 'wrong-passowrd') {
            print("Wrong Password");
          } else if (e.code == 'invalid-email') {
            print("Invalid email");
          }
        }
      }
    } catch (e) {}
  }
}
