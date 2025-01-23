import '../../../../../../core/resources/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';

class SingUpTextButton extends StatelessWidget {
  const SingUpTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account ?',
            style: TextStyles.font14deepGreenMedium.copyWith(
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: ' Sing Up',
            style: TextStyles.font14deepGreenMedium.copyWith(
              color: AppColor.kBlueColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.kSingUpView);
              },
          ),
        ],
      ),
    );
  }
}
