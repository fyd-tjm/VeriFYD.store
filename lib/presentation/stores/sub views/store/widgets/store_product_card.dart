import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

import '../../../../core/widgets/fyd_text_ellipsis.dart';

class StoreProductCard extends StatelessWidget {
  final Product product;
  final Function onProductTap;
  const StoreProductCard({
    Key? key,
    required this.product,
    required this.onProductTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onProductTap(product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.h,
            width: 180.h,
            child: Card(
                color: fydPLgrey.withOpacity(.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),

                //! Product Image
                child: (product.productImages.isNotEmpty)
                    ? Image.network(product.productImages.first)
                    : Center(
                        child: FydText.b3white(text: 'Image Not Available'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FydTextEllipsis(
                width: 170.h,
                fydText: FydText.b2grey(text: product.name),
              ),
              SizedBox(
                height: 4.h,
              ),
              FydText.b1white(
                text: '\$ ${product.sellingPrice}',
                weight: FontWeight.bold,
              ),
            ],
          ).paddingOnly(left: 10.w)
        ],
      ),
    );
  }
}
