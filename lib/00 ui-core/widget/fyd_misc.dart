import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:verifyd_store/00%20ui-core/core/fyd_colors.dart';
import 'package:verifyd_store/00%20ui-core/core/fyd_styles.dart';
import 'package:verifyd_store/00%20ui-core/widget/fyd_text.dart';

//?-----------------------------------------------------------------------------
Future<bool?> showOkDialog({
  required BuildContext context,
  required String message,
}) {
  final dialog = Dialog(
    backgroundColor: fydPWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: 280.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
// message
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 140.h),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, right: 15.w, left: 15.w, bottom: 20.h),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fydPDgrey,
                      fontSize: 18,
                      fontFamily: body16.fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
// Button
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 54.h,
                    // width: double.infinity,
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
                      onPressed: () => Navigator.of(context).pop(true),
                      child: FydText.h1custom(color: fydSOrange, text: 'Ok'),
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
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => dialog,
  );
}

//?-----------------------------------------------------------------------------

Future<bool?> showPermissionDialog({
  required BuildContext context,
  required String message,
}) {
  final dialog = Dialog(
    backgroundColor: fydPWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: 280.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
// message
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 140.h),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, right: 15.w, left: 15.w, bottom: 20.h),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: fydPDgrey,
                      fontSize: 18,
                      fontFamily: body16.fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
// Button
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 54.h,
                    // width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: fydPGrey, // background
                        onPrimary: fydPWhite, // foreground
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            // bottomRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(false),
                      child: FydText.h1white(
                        text: 'Cancel',
                        weight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 54.h,
                    // width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: fydPGrey, // background
                        onPrimary: fydPWhite, // foreground
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(true),
                      child: FydText.h1custom(color: fydSOrange, text: 'Allow'),
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
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => dialog,
  );
}

//?-----------------------------------------------------------------------------
void showSnack({
  required BuildContext context,
  String? message,
  int durationSeconds = 1,
  EdgeInsetsGeometry? margin,
  Color backgroundColor = fydPWhite,
  double backgroundOpacity = .5,
  FydText? fydText,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: durationSeconds),
      behavior: SnackBarBehavior.floating,
      elevation: 5.0,
      margin: margin,
      backgroundColor: backgroundColor.withOpacity(backgroundOpacity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.black.withOpacity(0.4),
          width: 3.0,
        ),
      ),
      content:
          (fydText == null) ? FydText.h3black(text: message ?? '') : fydText,
    ),
  );
}

//?-----------------------------------------------------------------------------
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
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => dialog,
  );

  return () => Navigator.of(context).pop();
}

//?-----------------------------------------------------------------------------
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
