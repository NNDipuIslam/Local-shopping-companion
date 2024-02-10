part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  SignUpRequested(this.email, this.password);
}
