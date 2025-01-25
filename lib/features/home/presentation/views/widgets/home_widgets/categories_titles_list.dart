import '../../../manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/app_colors.dart';

class CategoriesTitlesList extends StatefulWidget {
  const CategoriesTitlesList({super.key});

  @override
  State<CategoriesTitlesList> createState() => _CategoriesTitlesListState();
}

class _CategoriesTitlesListState extends State<CategoriesTitlesList> {
  String selectedCategory = "Smartphones";
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<ProductsCubit>().fetchProductsByCategory(selectedCategory);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToNextCategory() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentOffset = _scrollController.offset;
    if (currentOffset < maxScroll) {
      _scrollController.animateTo(
        currentOffset + 100.0, // adjust the scroll step size
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToPreviousCategory() {
    final currentOffset = _scrollController.offset;
    if (currentOffset > 0) {
      _scrollController.animateTo(
        currentOffset - 100.0, // adjust the scroll step size
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildGestureDetector(
          onTap: scrollToPreviousCategory,
          icon: Icons.arrow_left,
        ),
        SizedBox(
          width: 288.w,
          height: 50.h,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: categoriesTitle.length,
            itemBuilder: (context, index) {
              final category = categoriesTitle[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                  });
                  context
                      .read<ProductsCubit>()
                      .fetchProductsByCategory(category);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                    top: 10.h,
                    bottom: 10.h,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category
                            ? Colors.orange[300]
                            : Colors.grey,
                        fontWeight: selectedCategory == category
                            ? FontWeight.w600
                            : FontWeight.normal,
                        fontSize: selectedCategory == category ? 14.sp : 12.sp,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        buildGestureDetector(
          icon: Icons.arrow_right,
          onTap: scrollToNextCategory,
        ),
      ],
    );
  }

  GestureDetector buildGestureDetector({
    IconData? icon,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColor.kOrangeAccentColor,
        child: Icon(
          icon,
          size: 35,
          color: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}

List<String> categoriesTitle = [
  "Smartphones",
  "Beauty",
  "Fragrances",
  "Furniture",
  "Groceries",
  "Home Decoration",
  "Kitchen Accessories",
  "Laptops",
  "Mens Shirts",
  "Mens Shoes",
  "Mens Watches",
  "Mobile Accessories",
  "Motorcycle",
  "Skin Care",
  "Sports Accessories",
  "Sunglasses",
  "Tablets",
  "Tops",
  "Vehicle",
  "Womens Bags",
  "Womens Dresses",
  "Womens Jewellery",
  "Womens Shoes",
  "Womens Watches",
];
