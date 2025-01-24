import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,// products.length,
        itemBuilder: (context, index) {
          //final product = products[index];
          return GestureDetector(
            onTap: () {},
            child: const CategoryItem(),
          );
        },
      ),
    );
  }
}
