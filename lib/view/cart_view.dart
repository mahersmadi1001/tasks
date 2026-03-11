import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_packegs/blocs/cart_bloc/cart_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: Color(0xff1A1A1A),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartLoading():
              return Center(child: CircularProgressIndicator());
            case CartLoaded():
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 342.w,
                          height: 107.h,
                          margin: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffE6E6E6)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(9.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                state.cartItems[index].product.thumbnail,
                                height: 100.h,
                                width: 120.w,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.cartItems[index].product.title,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        state.cartItems[index].product.price
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 100.w),
                                      SizedBox(
                                        width: 100.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                context.read<CartBloc>().add(
                                                  AddToCart(
                                                    cartItemModel:
                                                        state.cartItems[index],
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.add),
                                            ),
                                            Text(
                                              state.cartItems[index].quantity
                                                  .toString(),
                                              style: TextStyle(fontSize: 30),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                context.read<CartBloc>().add(
                                                  RemoveFromCart(
                                                    cartItemModel:
                                                        state.cartItems[index],
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.remove),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Total Price : ${state.totalPrice}",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              );
            case CartEmpty():
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 100,
                        color: Color(0xffB3B3B3),
                      ),
                      Text(
                        'Your Cart is Empty!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 248,
                        child: Text(
                          'When you add products, they’ll appear here.',
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
