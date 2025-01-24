import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';

class ItemTitlePriceCart extends StatelessWidget {
  const ItemTitlePriceCart({
    super.key,
    required this.title,
    required this.price,
    this.cartOnTap,
    this.isCategory = false,
    this.rating,
  });
  final String title, price;
  final Function()? cartOnTap;
  final bool isCategory;
  final String? rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font14deepGreenMedium.copyWith(
                  color: AppColor.kBlackColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: TextStyles.font14deepGreenMedium.copyWith(
                      color: AppColor.kGrayColor,
                    ),
                  ),
                  if (isCategory)
                    Row(
                      children: [
                        SizedBox(width: 5.w),
                        Icon(
                          FontAwesomeIcons.star,
                          color: Colors.yellow[700],
                          size: 16,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          rating!,
                          style: TextStyles.font12GrayNormal,
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: GestureDetector(
              onTap: cartOnTap,
              child: Icon(
                FontAwesomeIcons.cartShopping,
                size: 30,
                color: Colors.orange[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
