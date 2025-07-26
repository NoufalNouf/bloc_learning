import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/cartlist_items.dart';
import '../../data/grocery_items.dart';
import '../../data/wishlist_items.dart';
import '../../model/home_product_data_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeIntialEvent>(homeInitialEvent);
    on<HomePageWishlistNavigateEvent>(homePageWishlistNavigateEvent);
    on<HomePageCartListNavigateEvent>(homePageCartListNavigateEvent);
    on<HomeScreenWishlistButtonClickedEvent>(
      homeScreenWishlistButtonClickedEvent,
    );
    on<HomeScreenCartListButtonClickedEvent>(
      homeScreenCartListButtonClickedEvent,
    );
  }

  FutureOr<void> homeInitialEvent(HomeIntialEvent event, Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(
      HomeLoadedSuccessState(
        products:
            GroceryItems.groceryListItems
                .map(
                  (e) => ProductDataModel(
                    id: e['id'],
                    name: e['name'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                    quantity: e['quantity'],
                  ),
                )
                .toList(),
      ),
    );
  }

  FutureOr<void> homePageWishlistNavigateEvent(HomePageWishlistNavigateEvent event, Emitter<HomeState> emit,
  ) {

    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homePageCartListNavigateEvent(HomePageCartListNavigateEvent event, Emitter<HomeState> emit,
  ) {

    emit(HomeNavigateToCartListPageActionState());
  }

  FutureOr<void> homeScreenWishlistButtonClickedEvent(HomeScreenWishlistButtonClickedEvent event, Emitter<HomeState> emit,
  ) {
    print('wishiconclicked');
    WishlistItems.add(event.clickedProduct);
    emit (HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeScreenCartListButtonClickedEvent(HomeScreenCartListButtonClickedEvent event, Emitter<HomeState> emit,
  ) {
    print('carticonclicked');
    CartlistItems.add(event.clickedProduct);
    emit (HomeProductItemCatListedActionState());
  }
}
