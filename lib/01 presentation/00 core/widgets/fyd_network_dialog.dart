import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/core/network/network_cubit.dart';

@lazySingleton
class FydNetworkDialog {
  final NetworkCubit cubit;
  //-----
  OverlayEntry? _overlay;
  FydNetworkDialog(this.cubit);
  //-----
  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: const Color(0x80000000),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                color: fydPgrey,
                width: 220.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(
                        'assets/logo/no-wifi.png',
                        width: 280.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40.w, right: 40.w, bottom: 15.h),
                      child: FydBtn(
                        onPressed: () => cubit.networkStatusCheck(),
                        height: 40.h,
                        color: fydPblack,
                        widget: const FydText.b2custom(
                          text: 'Re-try',
                          color: fydBblue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    log('hide-loading-overlay');
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
