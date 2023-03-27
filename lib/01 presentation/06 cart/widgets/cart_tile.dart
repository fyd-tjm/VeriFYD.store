import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

import '../../00 core/widgets/fyd_image_dialog.dart';

class CartTile extends StatelessWidget {
  final String imageLink;
  final String prodName;
  final String company;
  final String size;
  final double price;
  final int qty;
  final int availability;
  final VoidCallback onDecrementPressed;
  final VoidCallback onIncrementPressed;
  final VoidCallback onDeletePressed;
  const CartTile({
    Key? key,
    required this.prodName,
    required this.company,
    required this.size,
    required this.price,
    required this.qty,
    required this.availability,
    required this.onDecrementPressed,
    required this.onIncrementPressed,
    required this.imageLink,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! available view
        SizedBox(
          height: 90.h,
          width: double.infinity,
          child: Card(
            color: (availability >= qty) ? fydPwhite : Colors.grey[300],
            elevation: 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: (availability >= qty)
                  ? BorderSide.none
                  : const BorderSide(color: fydAred, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        imageUrl: imageLink,
                        onClose: () => Navigator.of(context).pop(true),
                      ),
                    );
                  },
                  child: SizedBox(
                      height: double.infinity,
                      width: 85.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: imageLink,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const SpinKitWave(
                            size: 20,
                            color: fydPgrey,
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            color: fydPgrey,
                            size: 70.h,
                          ),
                        ),
                      )),
                ),
                //! Product-Detail
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 5.w, right: 3.w, bottom: 3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Name : price : delete
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //! name
                                FydEllipsisText(
                                  width: MediaQuery.of(context).size.width * .6,
                                  fydText: FydText.b3black(text: prodName),
                                ),

                                //! price
                                FydText.b4custom(
                                  text: '₹ $price',
                                  color: fydBblue,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            //! delete btn
                            InkResponse(
                              onTap: onDeletePressed,
                              radius: 50,
                              child: const Icon(
                                Icons.cancel_outlined,
                                size: 22,
                                color: fydPgrey,
                              ),
                            ),
                          ],
                        ),
                        //! size : incre/decrement : qty
                        Row(
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
                                    horizontal: 6, vertical: 2),
                                child: FydText.b3custom(
                                  text: size,
                                  color: fydPwhite,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //! Editor
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //! Decreament-btn
                                  InkResponse(
                                    onTap: onDecrementPressed,
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 22,
                                      color: fydPgrey,
                                    ),
                                  ),
                                  //! QTY
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: FydText.b3custom(
                                      text: qty.toString().padLeft(2, '0'),
                                      color: fydPblack,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  //! Increament-btn
                                  InkResponse(
                                    onTap: onIncrementPressed,
                                    splashColor: fydBblue,
                                    child: const Icon(
                                      Icons.add_circle_sharp,
                                      size: 22,
                                      color: fydPgrey,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //! not available view
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! alert Message
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              // width: double.infinity,
              child: Text(
                (availability >= qty)
                    ? ''
                    : '$availability available right now',
                style: const TextStyle(
                    color: fydAred,
                    fontSize: 12,
                    letterSpacing: .9,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
      ],
    );
  }
}
