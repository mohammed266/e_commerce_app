import '../../../../../../core/resources/app_colors.dart';
import '../../../../data/models/products_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../manager/cart_cubit/cart_cubit.dart';

 addToCart(BuildContext context, ProductsModel productsModel) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Please login to add to cart'),
        action: SnackBarAction(
          label: 'Login',
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.kLoginView,
            );
          },
        ),
      ),
    );
    return;
  } else {
    context.read<CartCubit>().addToCart(
          productsModel.title,
          productsModel.price,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: AppColor.kOrangeAccentColor,
        content: Text(
          'Item added to cart successfully',
          style: TextStyle(
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
