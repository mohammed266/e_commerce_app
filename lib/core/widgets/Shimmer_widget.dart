import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Number of shimmer items
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            color: Colors.white,
            width: 180.w,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  Container(
                    height: 180.h,
                    width:180.w,
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 15.h,
                          width: 150.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 12.h,
                          width: 80.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}