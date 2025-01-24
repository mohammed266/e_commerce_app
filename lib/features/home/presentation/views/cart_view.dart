import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLightGrayColor,
      body: const SafeArea(
        child: Center(
          child: Text('CartView'),
        ),
      ),
    );
  }
}
