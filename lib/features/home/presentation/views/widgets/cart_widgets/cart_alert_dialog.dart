import 'package:flutter/material.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../manager/cart_cubit/cart_cubit.dart';

AlertDialog buildAlertDialog(BuildContext context, CartCubit cubit, item) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),  // Rounded corners
    ),
    backgroundColor: Colors.blueGrey[50],  // Light background color
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Confirm",
        style: TextStyles.font18GreenBold.copyWith(
          color: AppColor.kBlackColor,
        ),
      ),
    ),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Are you sure you want to delete this item?",
        style: TextStyles.font16BlackBold.copyWith(
          color: AppColor.kBlack87Color,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(true);
          cubit.deleteCartItem(
            item['name'],
            item['price'],
          );
        },
        child: const Text(
          "DELETE",
          style: TextStyle(color: AppColor.kRedColor),
        ),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: const Text(
          "CANCEL",
          style: TextStyle(color: AppColor.kBlueColor),
        ),
      ),
    ],
  );
}
