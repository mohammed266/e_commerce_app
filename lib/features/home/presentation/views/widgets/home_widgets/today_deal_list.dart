import 'dart:developer';
import '../../../../../../core/helper/toast_helper.dart';
import '../../../../../../core/widgets/Shimmer_widget.dart';
import '../../../manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'today_deal_list_item.dart';

class TodayDealList extends StatelessWidget {
  const TodayDealList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is ProductsLoading ||
          current is ProductsSuccess ||
          current is ProductsFailure,
      builder: (context, state) {
        if (state is ProductsSuccess) {
          final productsList = state.productsList;
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            height: 270.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: productsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TodayDealListItem(
                  productsModel: productsList[index],
                );
              },
            ),
          );
        } else if (state is ProductsLoading) {
          return const ShimmerWidget();
        } else if (state is ProductsFailure) {
          ToastHelper.showErrorToast(state.errMessage);
          log(state.errMessage);
        }
        return const Text('unhandled exception');
      },
    );
  }
}
