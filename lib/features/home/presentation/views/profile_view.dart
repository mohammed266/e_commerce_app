import '../manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_colors.dart';
import 'widgets/profile_widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLightGrayColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProfileCubit(),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
