import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/domain/store/store.dart';
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
      onTap: () => onPressedCallback(store),
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Card(
          color: fydPGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Store Image
              SizedBox(
                height: 80.h,
                width: 80.h,
                child: Card(
                  color: fydSBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: (store.storeLogo == '')
                      ? Center(
                          child: FydText.d3black(
                              text: Helpers.getInitials(store.name)))
                      : Image.network(
                          store.storeLogo,
                          fit: BoxFit.cover,
                        ),
                ),
              ).paddingSymmetric(horizontal: 10.w),
              Column(
                children: [
                  //! StoreName
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      store.name,
                      style: GoogleFonts.exo2(
                        color: fydSBlue,
                        fontSize: body16.fontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ).paddingOnly(top: 10.h),
                  //! StoreId
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      'storeId: ${store.sId}',
                      style: GoogleFonts.exo2(
                          color: fydTWhite,
                          fontSize: body12.fontSize,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  //! StoreAddress
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      store.storeAddress['default']!,
                      style: GoogleFonts.exo2(
                        color: fydTWhite,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ).paddingOnly(top: 8.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
