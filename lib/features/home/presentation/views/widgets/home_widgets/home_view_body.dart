import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import 'category_section.dart';
import 'today_deal_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Today's Deals",
            style: TextStyles.font20WhiteBold.copyWith(
              color: AppColor.kOrangeAccentColor,
            ),
          ),
          const TodayDealList(),
          35.verticalSpace,
          Text(
            "Categories",
            style: TextStyles.font20WhiteBold.copyWith(
              color: AppColor.kOrangeAccentColor,
            ),
          ),
          const CategorySection(),
        ],
      ),
    );
  }
}
