import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../guest_user.dart';
import 'cart_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FirebaseAuth.instance.currentUser != null
          ? Column(
              children: [
                Text(
                  "Cart Items",
                  style: TextStyles.font20WhiteBold.copyWith(
                    color: AppColor.kOrangeAccentColor,
                  ),
                ),
                20.verticalSpace,
                const Expanded(child: CartList()),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GuestUser(),
              ],
            ),
    );
  }
}
