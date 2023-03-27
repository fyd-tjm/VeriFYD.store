import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

class StoreProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onProductTap;
  final bool isPriceHidden;
  const StoreProductCard({
    Key? key,
    required this.product,
    required this.onProductTap,
    this.isPriceHidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onProductTap(product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: 180.w,
              width: 160.w,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: fydSblack, blurStyle: BlurStyle.inner)
              ]),
              child: CachedNetworkImage(
                imageUrl: product.thumbnailImage,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const SpinKitWave(
                  size: 20,
                  color: fydBblue,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 30,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! Product-name
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: FydEllipsisText(
                  width: 170.w,
                  fydText: FydText.b4custom(
                    text: product.name,
                    color: fydPgrey,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
              (isPriceHidden)
                  ? const SizedBox.shrink()
                  //! Product-price
                  : FydText.b3white(
                      text: '₹ ${product.sellingPrice}',
                      weight: FontWeight.bold,
                    ),
            ],
          )
        ],
      ),
    );
  }
}
