import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

import '../../../presentation/core/widgets/fyd_text_ellipsis.dart';

class StoreProductCard extends StatelessWidget {
  final Product product;
  final Function(Product) onProductTap;
  const StoreProductCard({
    Key? key,
    required this.product,
    required this.onProductTap,
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
          SizedBox(
            height: 190.h,
            width: 170.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                //! Product Image
                child: (product.thumbnailImage.isNotEmpty)
                    ? CachedNetworkImage(
                        imageUrl: product.thumbnailImage,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const SpinKitWave(
                          size: 20,
                          color: fydLogoBlue,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : const Center(
                        child: FydText.b4custom(
                          text: 'Image Not Available',
                          color: fydBlueGrey,
                        ),
                      )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! Product-name
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: FydEllipsisText(
                  width: 175.w,
                  fydText: FydText.b4custom(
                    text: product.name,
                    color: fydTGrey,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
              //! Product-price
              FydText.b3white(
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
