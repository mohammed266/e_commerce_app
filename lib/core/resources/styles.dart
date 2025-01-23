import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/font_weight_helper.dart';

class TextStyles {
  static TextStyle font30BlackBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.kBackGroundColor,
  );
  static TextStyle font20WhiteBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14deepGreenMedium = TextStyle(
    fontSize: 14.sp,
    color: AppColor.kButtonColor,
    fontWeight: FontWeightHelper.medium,
  );
}