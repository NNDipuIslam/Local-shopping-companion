import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:prac2/models/GetProductModel.dart';
import 'package:prac2/models/getBusinessModelUI.dart';
import 'package:prac2/models/getCartModelUI.dart';
import 'package:prac2/repository/authentication/CreateAccountRepo.dart';
import 'package:prac2/repository/authentication/CheckAccount.dart';
import 'package:prac2/repository/marketplace/GetProductRepo.dart';
import 'package:prac2/repository/marketplace/NewProductRepo.dart';
import 'package:prac2/repository/seller/NewBusiness.dart';
import 'package:prac2/repository/seller/getBusiness.dart';
import 'package:prac2/repository/carts/getCartRepo.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<CreateAccountEvent>(_createAccountEvent);
    on<CheckAccountEvent>(_checkAccountEvent);
    on<StartNewBusiness>(_startNewBusiness);
    on<BusinessInitialFetchEvent>(_businessInitialFetchEvent);
    on<NewProduct>(_newProduct);
    on<ProductInitialFetchEvent>(_productInitialFetchEvent);
    on<ItemInitialFetchEvent>(_itemInitialFetchEvent);
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

  FutureOr<void> _businessInitialFetchEvent(
      BusinessInitialFetchEvent event, Emitter<AccountState> emit) async {
    emit(BusinessFetchLoadingState());
    List<GetBusinessModelUi> posts = await getBusiness.fetch();
    emit(BusinessFetchSuccessState(posts: posts));
  }

  FutureOr<void> _newProduct(
      NewProduct event, Emitter<AccountState> emit) async {
    bool success = await NewProducts.create(event.ItemName, event.ItemPrice,
        event.image, event.ProductInformation, event.DeliveryInformation);
    if (success == true) {
      emit(ProductCreateSuccessState(success: success));
    } else
      emit(ProductCreateErrorState(success: success));
  }

  FutureOr<void> _productInitialFetchEvent(
      ProductInitialFetchEvent event, Emitter<AccountState> emit) async {
    emit(ProductFetchLoadingState());
    List<GetProductsModelUi> posts = await getProduct.fetch();
    emit(ProductFetchSuccessState(posts: posts));
  }

  FutureOr<void> _itemInitialFetchEvent(
      ItemInitialFetchEvent event, Emitter<AccountState> emit) async {
    emit(ItemFetchLoadingState());
    List<GetCartModelUi> posts = await getItem.fetch();
    emit(ItemFetchSuccessState(posts: posts));
  }
}
