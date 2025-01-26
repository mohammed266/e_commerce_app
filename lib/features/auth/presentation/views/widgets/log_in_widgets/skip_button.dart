import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(horizontal: 20..horizontalSpace),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.kMainHomeView);
        },
        child: Text(
          'Skip',
          style: TextStyles.font20WhiteBold,
        ),
      ),
    );
  }
}
