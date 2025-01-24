import 'package:flutter/material.dart';

import 'categories_titles_list.dart';
import 'category_list.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoriesTitlesList(),
        SizedBox(height: 5),
        CategoryList(),
      ],
    );
  }
}




