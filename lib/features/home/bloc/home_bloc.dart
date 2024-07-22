import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/grocery_data.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/home/model/home_product_data_model.dart';

import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistButtonNavigateEvent>(homeProductWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialFetchEvent(HomeInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds:3 ));
    emit(HomeLoadedSuccessState(
      products: GroceryData.groceryList.map((e)=>ProductModal(
        id: e['unit'], 
        name: e['name'], 
        description: e['type'],
        price: e['price'], 
        imageUrl: e['imageUrl'])).toList()
      ));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(HomeProductWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
      print("wishlist clicked");
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
        print("cart clicked");
    emit(HomePageNavigateToCartPageActionState());
  }

  
}


