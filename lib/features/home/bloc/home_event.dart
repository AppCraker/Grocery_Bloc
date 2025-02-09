part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent{
  
}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
