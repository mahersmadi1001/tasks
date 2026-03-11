import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_packegs/blocs/local_search_product_bloc/local_search_product_bloc.dart';

import 'package:test_packegs/blocs/product_bloc/product_bloc.dart';
import 'package:test_packegs/core/Widgets/product_ui.dart';
import 'package:test_packegs/view/search_view.dart';

TextEditingController tff_controller = TextEditingController();

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<ProductBloc>().add(GetAllProducts());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Discover',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 260.w,
                  height: 50.h,
                  child: TextField(
                    controller: tff_controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF9FAFB),
                      enabled: true,
                      hint: Row(
                        children: [
                          Icon(Icons.search, color: Color(0xff99A1AF)),
                          Text(
                            'Search Performs...',
                            style: TextStyle(color: Color(0xff99A1AF)),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff99A1AF)),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50.w,
                height: 50.h,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.r)),
                  ),
                  color: Color(0xff1A1A1A),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) =>
                              LocalSearchProductBloc()..add(GetAllData()),
                          child: SearchView(initialQuery: tff_controller.text),
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.filter_alt_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 90.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.circular(1.r),
                    ),
                    child: Center(child: Text('Tshirt')),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                switch (state.productStatus) {
                  case ProductStatus.initial:
                    return Center(child: CircularProgressIndicator());
                  case ProductStatus.success:
                    {
                      if (state.products.isEmpty) {
                        return Center(child: Text("No Data"));
                      } else {
                        return GridView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemCount: state.hasReachedMax
                              ? state.products.length
                              : state.products.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= state.products.length) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Product_Ui(
                                path_image: state.products[index].thumbnail,
                                price: state.products[index].price.toString(),
                                title: state.products[index].title,
                                id: state.products[index].id,
                                product: state.products[index],
                              );
                            }
                          },
                        );
                      }
                    }
                  case ProductStatus.failure:
                    return Center(
                      child: Text(state.errorMessage ?? "Error Message"),
                    );
                  case ProductStatus.loading:
                    {
                      if (state.products.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          controller: scrollController,
                          // shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemCount: state.hasReachedMax
                              ? state.products.length
                              : state.products.length + 1,
                          itemBuilder: (context, index) {
                            if (index >= state.products.length) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Product_Ui(
                                path_image: state.products[index].thumbnail,
                                price: state.products[index].title,
                                title: state.products[index].title,
                                id: state.products[index].id,
                                product: state.products[index],
                              );
                            }
                          },
                        );
                      }
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
