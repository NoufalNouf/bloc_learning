part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIntialEvent extends HomeEvent {}

class HomeScreenWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeScreenWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeScreenCartListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeScreenCartListButtonClickedEvent({required this.clickedProduct});
}

class HomePageWishlistNavigateEvent extends HomeEvent {}

class HomePageCartListNavigateEvent extends HomeEvent {}
