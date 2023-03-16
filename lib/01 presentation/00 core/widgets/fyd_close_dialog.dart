import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydCloseDialog extends StatelessWidget {
  const FydCloseDialog({
    super.key,
    required this.message,
    this.color = fydABlueGrey,
    required this.onClose,
  });
  final String message;
  final Color color;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: fydSgrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 160.h, maxWidth: 240.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! close-Btn
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      onClose();
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    splashRadius: 50,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: fydPblack,
                    ),
                  ),
                ],
              ),
              //! Message-View
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: FydText.b3custom(
                  text: message,
                  color: color,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
