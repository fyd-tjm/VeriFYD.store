import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

class ProfileAddressTile extends StatelessWidget {
  final FydAddress address;
  final String addressIndex;
  final VoidCallback onEditPresses;
  const ProfileAddressTile(
      {Key? key,
      required this.address,
      required this.addressIndex,
      required this.onEditPresses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Card(
        color: fydPGrey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              //! (name + phone)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      FydText.b1grey(
                        text: address.name,
                        weight: FontWeight.w600,
                      ),
                      // phone
                      FydText.b1grey(
                        text: Helpers.phoneMaskWithCountryCode(address.phone),
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
              //! (address + editBtn)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // (al1 + al2)
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text: "${address.line1}, ${address.line2}",
                          weight: FontWeight.w600,
                        ),
                      ),
                      // (state + pincode)
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text: '${address.city}, ${address.pincode}',
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // edit-Btn
                  TextButton(
                    onPressed: onEditPresses,
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: FydText.b2grey(
                      text: 'Edit',
                      weight: FontWeight.bold,
                    ),
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
