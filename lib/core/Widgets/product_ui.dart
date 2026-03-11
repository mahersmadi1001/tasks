import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_packegs/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:test_packegs/models/product_model.dart';
import 'package:test_packegs/view/details_view.dart';

class Product_Ui extends StatelessWidget {
  String path_image;
  int id;
  ProductModel product;
  String title;
  String price;
  Product_Ui({
    Key? key,
    required this.path_image,
    required this.title,
    required this.price,
    required this.id,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailsView(product: product);
                },
              ),
            );
          },
          child: Container(
            width: 160.w,
            height: 260.h,
            decoration: BoxDecoration(
              // border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    width: 160.w,
                    height: 140.h,
                    fit: BoxFit.cover,
                    path_image,
                  ),
                ),
                Text(title),
                Text('\$ ${price}'),
              ],
            ),
          ),
        ),
        Positioned(
          right: 30.w,
          top: 12.h,
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoaded) {
                bool isFav = state.products.any((item) {
                  return item.id == id;
                });
                return MaterialButton(
                  color: Colors.white,
                  minWidth: 45.w,
                  height: 45.h,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  onPressed: () {
                    context.read<FavoriteBloc>().add(
                      ToggleFavorite(product: product),
                    );
                  },
                  child: isFav
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_outline_outlined),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
