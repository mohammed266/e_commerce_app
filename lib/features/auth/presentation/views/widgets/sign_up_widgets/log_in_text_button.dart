import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';

class LogInTextButton extends StatelessWidget {
  const LogInTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'have an account ?',
            style: TextStyles.font14deepGreenMedium.copyWith(
              fontSize: 12.sp,
            ),
          ),
          TextSpan(
            text: ' Sing In',
            style: TextStyles.font14deepGreenMedium.copyWith(
              color: AppColor.kBlueColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
