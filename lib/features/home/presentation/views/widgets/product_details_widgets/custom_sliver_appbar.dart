import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../data/models/products_model.dart';
import 'custom_image_carousel.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, color: AppColor.kWhiteColor),
      ),
      expandedHeight: 320.h,
      pinned: true,
      backgroundColor: AppColor.kOrangeAccentColor,
      flexibleSpace: FlexibleSpaceBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Text(
              productsModel.title,
              style: TextStyles.font20WhiteBold,
            ),
          ),
        ),
        background: CustomImageCarousel(
          images: productsModel.images,
          height: 335.h,
          autoPlay: true,
        ),
      ),
    );
  }
}
