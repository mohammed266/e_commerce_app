import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/products_model.dart';

class CustomerReviewsList extends StatelessWidget {
  const CustomerReviewsList({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customer Reviews",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productsModel.reviews.length,
          itemBuilder: (context, index) => _buildReviewTile(
            productsModel.reviews[index].reviewerName,
            productsModel.reviews[index].rating.toDouble(),
            productsModel.reviews[index].comment,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewTile(String name, double rating, String review) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.yellow),
              SizedBox(width: 4.w),
              Text("$rating",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 8.h),
          Text(review, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
