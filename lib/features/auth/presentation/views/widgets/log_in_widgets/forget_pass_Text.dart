import 'package:e_commerce_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password button tap
        },
        child: Text(
          'Forgot Password ?',
          style: TextStyles.font14deepGreenMedium.copyWith(
            fontSize: 12.sp,
            color: AppColor.kBlueColor,
          ),
        ),
      ),
    );
  }
}
