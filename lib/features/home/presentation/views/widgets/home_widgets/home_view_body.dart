import '../../../manager/cart_cubit/cart_cubit.dart';
import '../../../../../../core/di/service_lacator.dart';
import '../../../../data/repos/products_repo/products_repo_impl.dart';
import '../../../manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import 'category_section.dart';
import 'today_deal_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(getIt.get<ProductsRepoImpl>())
              ..getTodayDealsProducts(),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
          ),
        ],
        child: Column(
          children: [
            Text(
              "Today's Deals",
              style: TextStyles.font20WhiteBold.copyWith(
                color: AppColor.kOrangeAccentColor,
              ),
            ),
            const TodayDealList(),
            35.verticalSpace,
            Text(
              "Categories",
              style: TextStyles.font20WhiteBold.copyWith(
                color: AppColor.kOrangeAccentColor,
              ),
            ),
            const CategorySection(),
          ],
        ),
      ),
    );
  }
}