import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../manager/cart_cubit/cart_cubit.dart';
import 'cart_alert_dialog.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartList,
    required this.index,
    required this.cartCubit,
  });

  final List cartList;
  final int index;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    final item = cartList[index];
    return GestureDetector(
      onTap: () {
        // navigate to product detail
      },
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cartList.removeAt(index);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Item removed from cart',
                style: TextStyle(color: AppColor.kWhiteColor),
              ),
              backgroundColor: AppColor.kOrangeAccentColor,
            ),
          );
        },
        confirmDismiss: (direction) async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider.value(
                value: cartCubit,
                child: buildAlertDialog(context, cartCubit, item),
              );
            },
          );
        },
        background: buildContainer(),
        child: buildCard(item),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.kRedColor,
      ),
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.delete,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }

  Card buildCard(item) {
    return Card(
      elevation: 4, // Add shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.white, // Background color of the card
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          item['name'] ?? '',
          style: TextStyles.font16BlackBold,
        ),
        subtitle: Text(
          'Price: \$${item['price']}',
          style: TextStyles.font14deepGreenMedium.copyWith(
            color: AppColor.kGrayColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: const Icon(
          FontAwesomeIcons.deleteLeft,
          color: AppColor.kRedColor,
        ),
      ),
    );
  }
}
