part of 'account_bloc.dart';

sealed class AccountEvent {}

class CreateAccountEvent extends AccountEvent {
  final String name;
  final String email;
  final String password;
  final String cpassword;
  CreateAccountEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.cpassword});
}

// ignore: must_be_immutable
class CheckAccountEvent extends AccountEvent {
  String email;
  String password;
  CheckAccountEvent({
    required this.email,
    required this.password,
  });
}
