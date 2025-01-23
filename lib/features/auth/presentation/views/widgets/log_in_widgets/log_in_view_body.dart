import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../manager/auth_cubit/auth_cubit.dart';
import 'log_in_form.dart';
import 'skip_button.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.kBackGroundColor,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: [
            SizedBox(height: 130.h),
            const SkipButton(),
            BlocProvider(
              create: (context) => AuthCubit(),
              child: const LogInForm(),
            ),
          ],
        ),
      ),
    );
  }
}