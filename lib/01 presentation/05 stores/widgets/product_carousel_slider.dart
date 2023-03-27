import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

class ProductCarouselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final int imageCount;
  final Function onSwap;
  const ProductCarouselSlider({
    Key? key,
    required this.imageUrls,
    required this.imageCount,
    required this.onSwap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageCount,
      itemBuilder: (_, idx, __) {
        return ProductImageHolder(imageUrl: imageUrls[idx]);
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const SpinKitWave(
              size: 20,
              color: fydBbluegrey,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.hide_image_outlined,
              size: 50,
              color: fydPgrey,
            ),
          )),
    );
  }
}
