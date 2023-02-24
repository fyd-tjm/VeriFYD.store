import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class StoreOfferCard extends StatelessWidget {
  const StoreOfferCard({
    super.key,
    required this.message,
    required this.iconData,
    this.iconSize = 25,
    this.iconColor = fydLogoBlue,
    required this.onTap,
  });
  final String message;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap(message);
      },
      child: Card(
        color: fydPLgrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! icon
              Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                ),
                child: CircleAvatar(
                  child: Icon(
                    iconData,
                    size: iconSize,
                    color: iconColor,
                  ),
                ),
              ),
              //! message
              Expanded(
                child: FydEllipsisText(
                  width: 10.w,
                  fydText: FydText.b4custom(
                    text: message,
                    color: fydTGrey,
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------
