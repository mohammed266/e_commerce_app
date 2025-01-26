import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../manager/profile_cubit/profile_cubit.dart';

class UserLogged extends StatelessWidget {
  const UserLogged({
    super.key,
    required this.userName,
  });

  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userName!,
          style: TextStyles.font30GreenBold,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40..horizontalSpace,
            vertical: 40..verticalSpace,
          ),
          child: AppButton(
            buttonText: 'Logout',
            textStyle: TextStyles.font14deepGreenMedium.copyWith(
              color: AppColor.kWhiteColor,
            ),
            onPressed: () {
              context.read<ProfileCubit>().signOutUser();
              Navigator.pushReplacementNamed(context, Routes.kLoginView);
            },
          ),
        ),
      ],
    );
  }
}
