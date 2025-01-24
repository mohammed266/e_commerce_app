import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import 'item_image.dart';
import 'item_title_price_cart.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      margin: EdgeInsets.only(right: 10.w),
      width: 180.w,
      child: Column(
        children: [
          const ItemImage(
            imageUrl: 'https://ntvb.tmsimg.com/assets/p22067809_b_h8_ag.jpg?w=960&h=540',
          ),
          ItemTitlePriceCart(
            isCategory: true,
            price: 'price',
            title: 'title',
            cartOnTap: (){},
            rating: 'rating',
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
      color: AppColor.kWhiteColor,
    );
  }
}