import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: buildBorderRadius(),
      child: CachedNetworkImage(
        height: 200.h,
        width: 180.w,
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  }

  BorderRadius buildBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(10.r),
      topRight: Radius.circular(10.r),
    );
  }
}