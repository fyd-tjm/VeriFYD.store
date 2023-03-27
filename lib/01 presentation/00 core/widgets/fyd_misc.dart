import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fyd_button.dart';
import 'fyd_colors.dart';
import 'fyd_text.dart';

//?--fyd-divider----------------------------------------------------------------

class FydDivider extends StatelessWidget {
  const FydDivider({
    Key? key,
    this.color = fydBblue,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Colors.transparent],
              begin: Alignment.center,
              end: Alignment.centerLeft,
            ),
          ),
          height: 1.0,
          width: MediaQuery.of(context).size.width / 2,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Colors.transparent],
              begin: Alignment.center,
              end: Alignment.centerRight,
            ),
          ),
          height: 1.0,
          width: MediaQuery.of(context).size.width / 2,
        ),
      ],
    );
  }
}

//?--Ok-Diaolog-----------------------------------------------------------------
Future<bool?> showOkDialog({
  required BuildContext context,
  String title = 'Title',
  Color textColor = fydABlueGrey,
  required String message,
}) {
  final dialog = Dialog(
    backgroundColor: fydPwhite,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(color: fydPblack)),
    child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: 160.h, maxWidth: 240.w),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.exo2(
                color: fydPblack,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.exo2(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Button
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: FydBtn(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.of(context).pop(true);
                    },
                    height: 40.h,
                    color: fydPblack,
                    widget: Text(
                      'Okay',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  return showModal<bool>(
    context: context,
    configuration: const FadeScaleTransitionConfiguration(
      barrierDismissible: true,
    ),
    useRootNavigator: false,
    builder: (context) => dialog,
  );
}
//?--Permission-Dialog----------------------------------------------------------

Future<bool?> showPermissionDialog({
  required BuildContext context,
  String title = 'Title',
  required String message,
  String trueBtnTitle = 'Allow',
  String falseBtnTitle = 'Cancel',
}) {
  final dialog = Dialog(
    backgroundColor: fydPwhite,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(color: fydPblack)),
    child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: 160.h, maxWidth: 240.w),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.exo2(
                color: fydPblack,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.exo2(
                  color: fydABlueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Button
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: FydBtn(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.of(context).pop(false);
                    },
                    height: 40.h,
                    color: fydPblack,
                    widget: Text(
                      falseBtnTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: FydBtn(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.of(context).pop(true);
                    },
                    height: 40.h,
                    isFilled: false,
                    fillColor: fydPwhite,
                    color: fydPblack,
                    widget: Text(
                      trueBtnTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPblack,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  return showModal<bool>(
    context: context,
    configuration: const FadeScaleTransitionConfiguration(
      barrierDismissible: false,
    ),
    useRootNavigator: false,
    builder: (c1) => dialog,
  );
}
//?---Snack-bar-----------------------------------------------------------------

enum SnackBarPosition { top, bottom }

enum SnackBarColor { dark, light }

enum SnackBarViewType { withNav, withoutNav }

void showSnack({
  required BuildContext context,
  String? message,
  double textSize = 18,
  FydText? fydText,
  EdgeInsetsGeometry? margin,
  Color? backgroundColor,
  double backgroundOpacity = .90,
  int durationSeconds = 2,
  SnackBarPosition snackPosition = SnackBarPosition.top,
  SnackBarColor snackBarColor = SnackBarColor.dark,
  SnackBarViewType viewType = SnackBarViewType.withoutNav,
}) {
  //------
  if (snackPosition == SnackBarPosition.top) {
    final x = (viewType == SnackBarViewType.withNav) ? 65.5.h : 0;
    margin = EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height * .87 - x,
      left: 10,
      right: 10,
    );
  }
  //------
  if (backgroundColor == null) {
    if (snackBarColor == SnackBarColor.dark) {
      backgroundColor = fydSblack;
    }
    if (snackBarColor == SnackBarColor.light) {
      backgroundColor = const Color.fromARGB(221, 178, 178, 178);
    }
  }
  //------
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  //------
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      elevation: 25.0,
      margin: margin,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: (fydText == null)
          ? FydText.b2custom(
              text: message ?? '',
              weight: FontWeight.bold,
              size: textSize,
              color: (snackBarColor == SnackBarColor.dark)
                  ? fydBbluegrey
                  : fydSblack,
            )
          : fydText,
    ),
  );
}

//?-----------------------------------------------------------------------------
