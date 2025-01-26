import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/toast_helper.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../manager/auth_cubit/auth_cubit.dart';
import 'forget_pass_Text.dart';
import 'sing_up_text_button.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: buildBoxDecoration(),
        child: Padding(
          padding: buildEdgeInsets(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildSignInText(),
                40.verticalSpace,
                CustomTextField(
                  controller: emailController,
                  hint: 'Email',
                  prefixIcon: buildPrefixIcon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                15.verticalSpace,
                CustomTextField(
                  controller: passController,
                  obscureText: true,
                  hint: 'Password',
                  prefixIcon: buildPrefixIcon(Icons.lock),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const ForgetPassText(),
                40.verticalSpace,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ToastHelper.showSuccessToast('logIn successfully');
                      Navigator.pushReplacementNamed(context, Routes.kMainHomeView);
                    } else if (state is AuthFailure) {
                      ToastHelper.showErrorToast(state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.kButtonColor,
                        ),
                      );
                    }
                    return AppButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().logInUser(
                                email: emailController.text,
                                password: passController.text,
                              );
                        }
                      },
                      buttonText: 'Sign In',
                      textStyle: TextStyles.font14WhiteMedium,
                    );
                  },
                ),
                10.verticalSpace,
                const SingUpTextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon buildPrefixIcon(IconData? icon) =>
      Icon(icon, color: AppColor.kButtonColor);

  Padding buildSignInText() {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Text(
        'Sign In',
        textAlign: TextAlign.center,
        style: TextStyles.font30GreenBold,
      ),
    );
  }

  EdgeInsets buildEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 16..horizontalSpace,
      vertical: 16..verticalSpace,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
  }
}
