part of 'auth_bloc.dart';

abstract class AuthState {}

class Loading extends AuthState {}

class unAuthenticated extends AuthState {}
