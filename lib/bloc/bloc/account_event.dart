// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class StartNewBusiness extends AccountEvent {
  String ShopName;
  String ShopLocation;
  String ShopType;
  String PhoneNumber;
  File image;
  StartNewBusiness({
    required this.ShopName,
    required this.ShopLocation,
    required this.ShopType,
    required this.PhoneNumber,
    required this.image,
  });
}

class geBusiness extends AccountEvent {}
