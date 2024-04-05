import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prac2/repository/authentication/CreateAccountRepo.dart';
import 'package:prac2/repository/authentication/CheckAccount.dart';
import 'package:prac2/repository/authentication/NewBusiness.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<CreateAccountEvent>(_createAccountEvent);
    on<CheckAccountEvent>(_checkAccountEvent);
    on<StartNewBusiness>(_startNewBusiness);
  }
}

FutureOr<void> _createAccountEvent(
    CreateAccountEvent event, Emitter<AccountState> emit) async {
  print(1);
  bool success = await CreateAccountRepo.create(
      event.name, event.email, event.password, event.cpassword);
  print(success);
  if (success == true) {
    emit(AccountCreateSuccessState(success: success));
  } else {
    emit(AccountCreateErrorState(success: success));
  }
}

FutureOr<void> _checkAccountEvent(
    CheckAccountEvent event, Emitter<AccountState> emit) async {
  String? token = await checkAccountRepo.check(event.email, event.password);
  if (token != null) {
    emit(AccountCheckSuccessState(token: token));
  } else {
    emit(AccountCheckErrorState());
  }
}

FutureOr<void> _startNewBusiness(
    StartNewBusiness event, Emitter<AccountState> emit) async {
  bool success = await NewBusiness.create(event.ShopName, event.ShopLocation,
      event.ShopType, event.PhoneNumber, event.image);
  print(success);
  if (success == true) {
    emit(BusinessCreateSuccessState(success: success));
  } else {
    emit(BusinessCreateErrorState(success: success));
  }
}
