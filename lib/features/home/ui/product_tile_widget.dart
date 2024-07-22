import 'package:bloc_project/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key, required this.productDataModel});

  final ProductModal productDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.maxFinite,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(productDataModel.imageUrl
                )
                )
            ),
          
          ),
          Text(productDataModel.name,style: TextStyle(color: Colors.white,fontSize: 18),),
          Text(productDataModel.description,style: TextStyle(color: Colors.white,)),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productDataModel.price.toString(),style: TextStyle(color: Colors.white,fontSize: 20)),

              Row(
                children: [
                  IconButton(
                onPressed: () {
                  
                },
                icon: Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                 
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}