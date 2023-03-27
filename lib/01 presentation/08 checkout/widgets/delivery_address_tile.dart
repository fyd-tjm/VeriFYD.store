import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

class DeliveryAddressTile extends StatelessWidget {
  final FydAddress address;
  final int addressIndex;
  final int? selectedIndex;
  final Function(int) onSelect;
  final Function(int) onEditPresses;

  const DeliveryAddressTile({
    required this.addressIndex,
    required this.address,
    required this.selectedIndex,
    required this.onSelect,
    required this.onEditPresses,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      color: fydSblack,
      onPressed: () => onSelect(addressIndex),
      height: 130.h,
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! (name + phone + radioBtn)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //! name:phone
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! name
                    FydText.b3custom(
                      color: fydPwhite,
                      text: address.name,
                      weight: FontWeight.w600,
                      letterSpacing: .8,
                    ),
                    //! phone
                    FydText.b3custom(
                      color: fydPwhite,
                      text: Helpers.phoneMaskWithCountryCode(address.phone),
                      weight: FontWeight.w600,
                      letterSpacing: .8,
                    ),
                  ],
                ),
                //! radio-Btn
                Radio(
                  value: addressIndex,
                  groupValue: selectedIndex,
                  onChanged: (v) {
                    onSelect(addressIndex);
                  },
                  toggleable: false,
                  fillColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return fydBblue;
                    }
                    return fydBbluegrey;
                  }),
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
                      width: 260.w,
                      fydText: FydText.b3custom(
                        text: '${address.city}, ${address.pincode}',
                        weight: FontWeight.w600,
                        color: fydBbluegrey,
                      ),
                    ),
                  ],
                ),
                //! edit-Btn
                TextButton(
                  onPressed: () => onEditPresses(addressIndex),
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  child: const FydText.b2custom(
                    text: 'Edit',
                    color: fydBblue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
