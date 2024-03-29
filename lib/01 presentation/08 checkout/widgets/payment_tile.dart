import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';

class PaymentTile extends StatelessWidget {
  final PaymentMode? paymentMode;
  final String title;
  final PaymentMode? selectedMode;
  final Function(PaymentMode) onSelect;

  const PaymentTile({
    required this.onSelect,
    Key? key,
    required this.paymentMode,
    required this.title,
    required this.selectedMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      height: 60.h,
      color: fydSblack,
      onPressed: () => (paymentMode == null) ? {} : onSelect(paymentMode!),
      widget: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! title
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: FydText.h3custom(
              text: title,
              color: fydBbluegrey,
              weight: FontWeight.bold,
            ),
          ),
          (paymentMode == null)
              //! comming soon
              ? Padding(
                  padding: EdgeInsets.only(right: 0.w),
                  child: Image.asset(
                    AssetHelper.comming_soon_tag,
                    width: 100,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitWidth,
                  ),
                )
              //! radio-Btn
              : Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Radio<PaymentMode?>(
                    value: paymentMode,
                    groupValue: selectedMode,
                    onChanged: (v) {
                      onSelect(paymentMode!);
                    },
                    toggleable: false,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return fydBblue;
                      }
                      return fydBbluegrey;
                    }),
                  ),
                ),
        ],
      ),
    );
  }
}
