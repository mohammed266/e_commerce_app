import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../add_to_cart.dart';
import 'item_image.dart';
import 'item_title_price_cart.dart';

class TodayDealListItem extends StatelessWidget {
  const TodayDealListItem({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 180.w,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          ItemImage(
            imageUrl: productsModel.thumbnail,
          ),
          ItemTitlePriceCart(
            title: productsModel.title,
            price: productsModel.price.toString(),
            cartOnTap: (){
              addToCart(context,productsModel);
            },
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
