import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/app_cached_network_image.dart';

class CustomImageCarousel extends StatelessWidget {
  const CustomImageCarousel({
    super.key,
    required this.images,
    this.height,
    this.autoPlay,
  });
  final List<dynamic> images;
  final double? height;
  final bool? autoPlay;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length - 1,
      itemBuilder: (context, index, realIndex) {
        return AppCachedNetworkImage(
          imgUrl: images[index].toString(),
        );
      },
      options: CarouselOptions(
        height: height ?? 220.h,
        viewportFraction: 1,
        autoPlay: autoPlay ?? false,
        autoPlayInterval: const Duration(milliseconds: 2000),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
      ),
    );
  }
}
