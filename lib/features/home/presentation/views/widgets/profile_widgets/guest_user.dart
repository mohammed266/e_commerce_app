import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';

class GuestUser extends StatelessWidget {
  const GuestUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Join us to continue',
          style: TextStyles.font18GreenBold,
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40..horizontalSpace,
            vertical: 10..verticalSpace,
          ),
          child: AppButton(
            buttonText: 'LogIn',
            textStyle: TextStyles.font14deepGreenMedium.copyWith(
              color: AppColor.kWhiteColor,
            ),
            onPressed: () {
              // Navigate to the login view
              Navigator.pushReplacementNamed(context, Routes.kLoginView);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40..horizontalSpace,
            vertical: 10..verticalSpace,
          ),
          child: AppButton(
            buttonText: 'SignUp',
            textStyle: TextStyles.font14deepGreenMedium.copyWith(
              color: AppColor.kWhiteColor,
            ),
            onPressed: () {
              // Navigate to the signup view
              Navigator.pushReplacementNamed(context, Routes.kSingUpView);
            },
          ),
        ),
      ],
    );
  }
}
