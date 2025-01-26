import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../manager/profile_cubit/profile_cubit.dart';
import 'guest_user.dart';
import 'user_logged.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    // Fetch the user name when the widget is initialized
    context.read<ProfileCubit>().getCurrentUserName();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // Handling loading state
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kBackGroundColor),
          );
        }
        // Handling success state
        if (state is ProfileSuccess) {
          final userName = state.userName;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // If user is logged in, show the logged-in UI, otherwise show guest UI
              (userName != null && userName.isNotEmpty)
                  ? UserLogged(userName: userName)
                  : const GuestUser(),
            ],
          );
        }
        // Handling failure state (error fetching user data)
        if (state is ProfileFailure) {
          return Center(
            child: Text(
              'Error: ${state.errMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        // Default case if no matching state (should not reach here)
        return const SizedBox.shrink();
      },
    );
  }
}
