import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Carted Items',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {

          // TODO: implement listener
        },
        builder: (context, state) {
         switch (state.runtimeType){
           case CartSuccessState:
             final successState = state as CartSuccessState;
             return ListView.builder(
               itemCount: successState.cartItem.length,
                 itemBuilder: (context,index){
               return CartTileWidget(
                   productDataModel: successState.cartItem[index],
                   cartBloc: cartBloc);
             });
           default :
             return SizedBox();
         }
        },
      ),
    );
  }
}


