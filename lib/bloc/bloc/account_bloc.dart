import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prac2/repository/authentication/CreateAccountRepo.dart';
import 'package:prac2/repository/authentication/CheckAccount.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<CreateAccountEvent>(_createAccountEvent);
    on<CheckAccountEvent>(_checkAccountEvent);
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
