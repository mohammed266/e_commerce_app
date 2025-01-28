import 'package:e_commerce_app/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';

import 'custom_sliver_appbar.dart';
import 'product_details_item.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            CustomSliverAppBar(productsModel: productsModel),
            ProductDetailsItem(productsModel: productsModel),
          ],
        ),
        _buildBottomActionButtons(),
      ],
    );
  }

  Widget _buildBottomActionButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10.h,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 16..horizontalSpace,
          vertical: 8..verticalSpace,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.kOrangeAccentColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Buy Now action
                },
                child: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add to Cart action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.kOrangeAccentColor,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
