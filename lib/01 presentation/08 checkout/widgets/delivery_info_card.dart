import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

class DeliveryInfoCard extends StatelessWidget {
  final FydAddress address;
  const DeliveryInfoCard({
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line1 = (address.line1);
    final line2 = address.line2;
    final city = (address.city);
    final addressState = (address.state);
    final name = (address.name);
    final phone = Helpers.phoneMaskWithCountryCode(address.phone);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! (name : phone : email)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! heading
                  const FydText.b1custom(
                    text: 'Delivery Info',
                    color: fydBblue,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! name
                      FydText.b4white(
                        text: name,
                        weight: FontWeight.w600,
                        color: fydPwhite,
                        letterSpacing: .8,
                      ),
                      //! phone
                      FydText.b4white(
                        text: phone,
                        weight: FontWeight.w600,
                        color: fydPwhite,
                        letterSpacing: .8,
                      ),
                      //! email
                      FydText.b4white(
                        text: address.email,
                        weight: FontWeight.w600,
                        color: fydPwhite,
                        letterSpacing: .8,
                      ),
                    ],
                  ),
                ],
              ),
              //! (line1, line2, city, state, pinCode)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! (al1 + al2)
                  FydEllipsisText(
                    width: 270.w,
                    fydText: FydText.b3custom(
                      text: "$line1, $line2",
                      weight: FontWeight.w600,
                      color: fydBbluegrey,
                    ),
                  ),
                  //! (city + state + pincode)
                  FydEllipsisText(
                    width: 270.w,
                    fydText: FydText.b3custom(
                      text: '$city, $addressState, ${address.pincode}',
                      weight: FontWeight.w600,
                      color: fydBbluegrey,
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
