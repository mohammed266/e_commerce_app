import '../../../../../../core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../data/models/products_model.dart';
import 'custom_image_carousel.dart';
import 'customer_reviews_list.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16..verticalSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductTitle(),
              SizedBox(height: 8.h),
              _buildProductDescription(),
              SizedBox(height: 8.h),
              _buildPriceDetails(),
              SizedBox(height: 8.h),
              _buildRatingDetails(),
              SizedBox(height: 8.h),
              _buildBrandDetails(),
              SizedBox(height: 16.h),
              _buildAdditionalImageCarousel(),
              SizedBox(height: 16.h),
              CustomerReviewsList(productsModel: productsModel),
              50.verticalSpace,
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildProductTitle() {
    return Text(
      productsModel.title,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProductDescription() {
    return Text(
      productsModel.description.toString(),
      style: TextStyle(fontSize: 16.sp),
    );
  }

  Widget _buildPriceDetails() {
    return Row(
      children: [
        Text(
          "Price: ",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          " {${productsModel.price}}",
          style: TextStyles.font18GreenBold.copyWith(
            decoration: TextDecoration.lineThrough,
            color: AppColor.kBlackColor,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "${productsModel.discountPercentage}%",
          style: TextStyles.font18GreenBold.copyWith(
            color: AppColor.kBlackColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingDetails() {
    return Row(
      children: [
        Text(
          "Rating: ",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.star, color: Colors.yellow),
        SizedBox(width: 4.w),
        Text(
          productsModel.rating.toString(),
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }

  Widget _buildBrandDetails() {
    return Row(
      children: [
        Text(
          "Brand: ",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          productsModel.brand.toString(),
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }

  Widget _buildAdditionalImageCarousel() {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey[200],
      ),
      child: Center(
        child: CustomImageCarousel(images: productsModel.images),
      ),
    );
  }
}
