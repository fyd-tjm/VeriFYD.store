import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

class ProfileAddressTile extends StatelessWidget {
  final FydAddress address;
  final int addressIndex;
  final Function(int) onEditPresses;
  const ProfileAddressTile(
      {Key? key,
      required this.address,
      required this.addressIndex,
      required this.onEditPresses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: Card(
        color: fydSblack,
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
                      //! name
                      FydText.b3custom(
                        color: fydPwhite,
                        text: address.name,
                        weight: FontWeight.w600,
                      ),
                      //! phone
                      FydText.b3custom(
                        color: fydPwhite,
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
                      //! (al1 + al2)
                      FydEllipsisText(
                        width: 270.w,
                        fydText: FydText.b3custom(
                          text: "${address.line1}, ${address.line2}",
                          color: fydBbluegrey,
                          weight: FontWeight.w600,
                        ),
                      ),
                      //! (state + pincode)
                      FydEllipsisText(
                        width: 270.w,
                        fydText: FydText.b3custom(
                          text: '${address.city}, ${address.pincode}',
                          color: fydBbluegrey,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  //! edit-Btn
                  TextButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      onEditPresses(addressIndex);
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    child: const FydText.b2custom(
                      color: fydBblue,
                      text: 'Edit',
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
