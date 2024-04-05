// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_bloc.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}

// ignore: must_be_immutable
class AccountCreateSuccessState extends AccountState {
  bool success;
  AccountCreateSuccessState({
    required this.success,
  });
}

// ignore: must_be_immutable
class AccountCreateErrorState extends AccountState {
  bool success;
  AccountCreateErrorState({
    required this.success,
  });
}

class AccountCheckSuccessState extends AccountState {
  final String token;
  AccountCheckSuccessState({
    required this.token,
  });
}

class AccountCheckErrorState extends AccountState {}

class PasswordVisibilityChangeState extends AccountState {
  final bool isPasswordVisible;

  PasswordVisibilityChangeState(this.isPasswordVisible);
}

class BusinessCreateErrorState extends AccountState {
  bool success;
  BusinessCreateErrorState({
    required this.success,
  });
}

class BusinessCreateSuccessState extends AccountState {
  bool success;
  BusinessCreateSuccessState({
    required this.success,
  });
}
