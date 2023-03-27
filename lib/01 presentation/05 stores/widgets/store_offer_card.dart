import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_close_dialog.dart';

class StoreOfferCard extends StatelessWidget {
  const StoreOfferCard({
    super.key,
    required this.message,
    required this.iconData,
    this.iconSize = 25,
    this.iconColor = fydBgreen,
  });
  final String message;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HapticFeedback.mediumImpact();
        await showModal<bool>(
          context: context,
          configuration: const FadeScaleTransitionConfiguration(
            barrierDismissible: true,
          ),
          useRootNavigator: false,
          builder: (context) => FydCloseDialog(
            message: message,
            color: fydSblack,
            onClose: () => Navigator.of(context).pop(true),
          ),
        );
      },
      child: Card(
        color: fydSgrey,
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
                    color: fydSblack.withOpacity(.7),
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
