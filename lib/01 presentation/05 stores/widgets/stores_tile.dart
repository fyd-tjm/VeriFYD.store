import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

class StoresTile extends StatelessWidget {
  final Store store;
  final Function(Store) onPressedCallback;
  const StoresTile({
    super.key,
    required this.store,
    required this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onPressedCallback(store);
      },
      child: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: Card(
          color: fydSblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Store Image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: 70.h,
                  width: 70.h,
                  child: Card(
                    color: fydPblack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: (store.storeLogo.isEmpty)
                        ? Center(
                            child: FydText.d3black(
                                text: Helpers.getInitials(store.name)))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                              imageUrl: store.storeLogo,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const SpinKitWave(
                                size: 20,
                                color: fydBblue,
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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! StoreName
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: FydTextEllipsis(
                      width: 220.w,
                      fydText: FydText.b2custom(
                        text: store.name,
                        color: fydBbluegrey,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                  //! StoreId
                  FydRichText(
                    size: 14,
                    color: fydPgrey,
                    weight: FontWeight.w600,
                    letterSpacing: .9,
                    textList: [
                      const TextSpan(
                        text: 'store-id: ',
                      ),
                      TextSpan(
                          text: store.storeId,
                          style:
                              const TextStyle(color: fydBblue, fontSize: 16)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
