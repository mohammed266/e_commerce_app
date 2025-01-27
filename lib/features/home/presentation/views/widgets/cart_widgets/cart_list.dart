import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../manager/cart_cubit/cart_cubit.dart';
import 'cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  void initState() {
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is CartLoading ||
          current is CartLoaded ||
          current is CartError,
      builder: (context, state) {
        // Handling loading state
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kBackGroundColor),
          );
        }
        // Handling success state
        if (state is CartLoaded) {
          final cartList = state.items;
          if (cartList.isNotEmpty) {
            return ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final cubit = context.read<CartCubit>();
                return CartItem(
                  cartList: cartList,
                  index: index,
                  cartCubit: cubit,
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Cart is empty',
                style: TextStyles.font18GreenBold,
              ),
            );
          }
        }
        // Handling failure state (error fetching user data)
        if (state is CartError) {
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
