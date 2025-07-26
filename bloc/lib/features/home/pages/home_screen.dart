
import 'package:bloc_app/features/home/pages/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cartlist/pages/cart_screen.dart';
import '../../wishlist/pages/wishlist_screen.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homebloc.add(HomeIntialEvent());
    super.initState();
  }

  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      bloc: homebloc,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        } else if (state is HomeNavigateToCartListPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        }
        else if (state is HomeProductItemWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item WishListed')));
        }
        else if (state is HomeProductItemCatListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomePageWishlistNavigateEvent());
                    },
                    icon: Icon(Icons.favorite, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomePageCartListNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ],
                title: Text(
                  'Grocery Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: successState.products[index],
                    homeBloc: homebloc,
                  );
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text("Error")));
          default:
            return SizedBox();
        }
      },
    );
  }
}
