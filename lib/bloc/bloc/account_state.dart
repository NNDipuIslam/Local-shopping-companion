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

class BusinessFetchSuccessState extends AccountState {
  final List<GetBusinessModelUi> posts;
  BusinessFetchSuccessState({
    required this.posts,
  });
}

class BusinessFetchErrorState extends AccountState {
  bool success;
  BusinessFetchErrorState({
    required this.success,
  });
}

class BusinessFetchLoadingState extends AccountState {}

class ProductFetchLoadingState extends AccountState {}

class ProductFetchSuccessState extends AccountState {
  final List<GetProductsModelUi> posts;
  ProductFetchSuccessState({
    required this.posts,
  });
}

class ProductFetchErrorState extends AccountState {
  bool success;
  ProductFetchErrorState({
    required this.success,
  });
}

class ProductCreateErrorState extends AccountState {
  bool success;
  ProductCreateErrorState({
    required this.success,
  });
}

class ProductCreateSuccessState extends AccountState {
  bool success;
  ProductCreateSuccessState({
    required this.success,
  });
}

class ItemCreateSuccessState extends AccountState {
  bool success;
  ItemCreateSuccessState({
    required this.success,
  });
}

class ItemCreateErrorState extends AccountState {
  bool success;
  ItemCreateErrorState({
    required this.success,
  });
}

class ItemFetchLoadingState extends AccountState {}

class ItemFetchErrorState extends AccountState {
  bool success;
  ItemFetchErrorState({
    required this.success,
  });
}

class ItemFetchSuccessState extends AccountState {
  final List<GetCartModelUi> posts;
  ItemFetchSuccessState({
    required this.posts,
  });
}
