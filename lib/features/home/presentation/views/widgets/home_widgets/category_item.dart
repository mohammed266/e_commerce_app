import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import 'item_image.dart';
import 'item_title_price_cart.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      margin: EdgeInsets.only(right: 10.w),
      width: 180.w,
      child: Column(
        children: [
          ItemImage(
            imageUrl: productsModel.thumbnail,
          ),
          ItemTitlePriceCart(
            isCategory: true,
            price: productsModel.price.toString(),
            title: productsModel.title,
            rating: productsModel.rating.toString(),
            cartOnTap: (){},
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