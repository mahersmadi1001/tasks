import 'package:ecommerce_app/view/details_view.dart';
import 'package:ecommerce_app/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task_22_full_design/views/details_view.dart';
// import 'package:task_22_full_design/views/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                child: FloatingActionButton(
                  heroTag: 'filter_button',
                  backgroundColor: Color(0xff1A1A1A),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchView()),
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
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsView();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 160.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'images/product_image.png',
                                width: 140.w,
                              ),
                            ),
                            Text('Regular Fit Slogan'),
                            Text('\$ 1,190'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: FloatingActionButton(
                          heroTag: 'favorite_button',
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
