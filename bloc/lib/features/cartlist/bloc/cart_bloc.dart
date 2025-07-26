import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

    List<ProductDataModel> cartItem = [];

  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }




  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItem: cartItem));
  }
}

