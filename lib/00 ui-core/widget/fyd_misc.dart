// ignore_for_file: non_constant_identifier_names
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

//?--fyd-divider----------------------------------------------------------------

class FydDivider extends StatelessWidget {
  const FydDivider({
    Key? key,
    this.color = fydSCPink,
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
  Color textColor = fydSCBlueGrey,
  required String message,
}) {
  final dialog = Dialog(
    backgroundColor: fydPWhite,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(color: fydPDgrey)),
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
                color: fydPDgrey,
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
                    onPressed: () => Navigator.of(context).pop(true),
                    height: 40.h,
                    color: fydPDgrey,
                    widget: Text(
                      'Okay',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPWhite,
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
    backgroundColor: fydPWhite,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: const BorderSide(color: fydPDgrey)),
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
                color: fydPDgrey,
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
                  color: fydSCBlueGrey,
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
                    onPressed: () => Navigator.of(context).pop(false),
                    height: 40.h,
                    color: fydPDgrey,
                    widget: Text(
                      falseBtnTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPWhite,
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
                    onPressed: () => Navigator.of(context).pop(true),
                    height: 40.h,
                    isFilled: false,
                    fillColor: fydPWhite,
                    color: fydPDgrey,
                    widget: Text(
                      trueBtnTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: fydPDgrey,
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
      backgroundColor = fydPGrey;
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
      elevation: 5.0,
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
                  ? fydBlueGrey
                  : fydPGrey,
            )
          : fydText,
    ),
  );
}

//?-----------------------------------------------------------------------------

//! junk --to be in Trash-------------------------------------------------------

typedef CloseDialog = void Function();

CloseDialog showLoadingScreen({
  required BuildContext context,
  required String? text,
}) {
  final dialog = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpinKitWave(
          color: fydPDgrey,
          size: 30.0,
        ),
        const SizedBox(height: 10),
        (text != null)
            ? FydText.b2black(
                text: text,
                weight: FontWeight.w400,
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
  showModal(
    context: context,
    configuration: const FadeScaleTransitionConfiguration(
      barrierDismissible: false,
    ),
    builder: (_) => dialog,
  );

  return () => Navigator.of(context).pop();
}

//?-----------------------------------------------------------------------------

//! junk --to be in Trash-------------------------------------------------------
void fydSnack({
  String title = '',
  required String message,
  SnackPosition snackposition = SnackPosition.BOTTOM,
}) {
  Get.closeAllSnackbars();
  Get.snackbar(title, '',
      messageText: FydText.h3black(
        text: message,
        weight: FontWeight.w500,
      ),
      duration: const Duration(milliseconds: 1500),
      snackPosition: snackposition,
      isDismissible: true,
      padding: const EdgeInsets.all(6));
}

class FydLoader {
  static void showLoading() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SpinKitSpinningLines(
                color: fydPWhite,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}

//! junk --to be in Trash-------------------------------------------------------
void fydDialog({
  required String title,
  required String message,
  required String buttonName,
  required VoidCallback onPresss,
  bool isDismissable = true,
}) {
  Get.dialog(
    barrierDismissible: isDismissable,
    transitionCurve: Curves.easeIn,
    Dialog(
      backgroundColor: fydPWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
          height: 200.h,
          width: 280.w,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
// title
              Padding(
                padding: EdgeInsets.only(
                  top: 12.h,
                  right: 15.w,
                  left: 15.w,
                ),
                child: Column(
                  children: [
                    FydText.h1black(text: title),
                    const Divider(
                      color: fydPDgrey,
                      thickness: 1.0,
                    ),
                  ],
                ),
              ),
// message
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: fydPDgrey,
                        fontSize: body12.fontSize,
                        fontFamily: body16.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
// Button
              Column(
                children: [
                  SizedBox(
                    height: 54.h,
                    width: 280.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: fydPGrey, // background
                        onPrimary: fydPWhite, // foreground
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                      onPressed: onPresss,
                      child: FydText.h1white(text: buttonName),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
