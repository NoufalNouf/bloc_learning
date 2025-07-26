import 'package:flutter/material.dart';

import '../../model/home_product_data_model.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final  ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({super.key,
    required this.productDataModel, required this.cartBloc
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('S.No : ${productDataModel.id}'),
        ),
        Container(
          margin:  const EdgeInsets.all(20),
          padding:  const EdgeInsets.all(10),

          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 4),
              image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl),fit: BoxFit.cover
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name :  ${productDataModel.name}',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 150,),
                  IconButton(onPressed: ()
                  {
                    //homeBloc.add(HomeScreenWishlistButtonClickedEvent(clickedProduct: productDataModel));
                  },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: ()
                  {
                    //homeBloc.add(HomeScreenCartListButtonClickedEvent(clickedProduct: productDataModel));
                  },
                      icon: Icon(Icons.shopping_cart_outlined))
                ],
              ),
              Text('Quantity : ${productDataModel.quantity}'),
              SizedBox(height: 10,),
              Text('Price  : ${productDataModel.price}'),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
