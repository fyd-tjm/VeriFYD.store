import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_image_dialog.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';

class OrderItemTile extends StatelessWidget {
  final Product product;
  final String sku;
  final int qty;
  final String size;
  const OrderItemTile({
    Key? key,
    required this.product,
    required this.sku,
    required this.size,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 80.w,
        color: fydSblack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! Product-Image (width:85w)
            GestureDetector(
              onTap: () async {
                //! image-Pop dialog
                await showModal<bool>(
                  context: context,
                  configuration: const FadeScaleTransitionConfiguration(
                    barrierDismissible: true,
                  ),
                  useRootNavigator: false,
                  builder: (context) => FydImageDialog(
                    imageUrl: product.thumbnailImage,
                    onClose: () => Navigator.of(context).pop(true),
                  ),
                );
              },
              child: SizedBox(
                height: double.infinity,
                width: 75.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: product.thumbnailImage,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const SpinKitWave(
                      size: 20,
                      color: fydPgrey,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image_not_supported_outlined,
                      color: fydPgrey,
                      size: 30.h,
                    ),
                  ),
                ),
              ),
            ),
            //! Product-Detail
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! productName: companyName: skuId
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! productName: companyName
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //! productName
                            FydEllipsisText(
                              width: MediaQuery.of(context).size.width * .6,
                              fydText: FydText.b4custom(
                                text: product.name,
                                color: fydPgrey,
                                weight: FontWeight.normal,
                              ),
                            ),
                            //! companyName
                            FydText.b4custom(
                              text: product.company,
                              color: fydBbluegrey,
                              size: 13,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        //! skuId
                        FydRichText(
                          size: 13,
                          color: fydPgrey,
                          textList: [
                            const TextSpan(text: 'sku: '),
                            TextSpan(
                              text: product.skuId,
                              style: const TextStyle(
                                  color: fydABlueGrey, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //! size : qty X price
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //! Size
                        Card(
                          color: fydPgrey,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: FydText.b3custom(
                              text: size,
                              color: fydPwhite,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //! qty X price
                        FydRichText(
                          size: 15,
                          color: fydBbluegrey,
                          textList: [
                            //! Price
                            TextSpan(text: '₹ ${product.sellingPrice.toInt()}'),
                            //! X
                            const TextSpan(
                                text: '  X  ',
                                style: TextStyle(
                                    color: fydABlueGrey, fontSize: 18)),
                            //! Qty
                            TextSpan(text: qty.toString().padLeft(2, '0'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
