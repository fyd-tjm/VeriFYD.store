import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCarouselSlider extends StatelessWidget {
  final List<String> imageUrl;
  final int imageCount;
  final Function onSwap;
  const ProductCarouselSlider({
    Key? key,
    required this.imageUrl,
    required this.imageCount,
    required this.onSwap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageCount,
      itemBuilder: (_, idx, __) {
        return ProductImageHolder(imageUrl: imageUrl[idx]);
      },
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          onSwap(index);
        },
      ),
    );
  }
}

class ProductImageHolder extends StatelessWidget {
  final String imageUrl;
  const ProductImageHolder({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ));
  }
}
