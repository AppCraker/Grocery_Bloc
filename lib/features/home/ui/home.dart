import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomePageNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Nagu Mart"),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductWishlistButtonNavigateEvent());
                },
                icon: Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
 