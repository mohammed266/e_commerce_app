import 'dart:developer';

import '../../../../../../core/widgets/Shimmer_widget.dart';
import '../../../../../../core/helper/toast_helper.dart';
import '../../../manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is CategoryLoading ||
          current is CategorySuccess ||
          current is CategoryFailure,
      builder: (context, state) {
        if (state is CategorySuccess) {
          final list = state.categoryList;
          return SizedBox(
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: CategoryItem(
                    productsModel: list[index],
                  ),
                );
              },
            ),
          );
        } else if (state is CategoryLoading) {
          return const ShimmerWidget();
        } else if (state is CategoryFailure) {
          ToastHelper.showErrorToast(state.errMessage);
          log(state.errMessage);
        }
        return const Text('unhandled exception');
      },
    );
  }
}
