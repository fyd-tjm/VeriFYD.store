//! Info-Card--
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class StoreInfoCard extends StatelessWidget {
  final List<String> infoList;
  final CrossAxisAlignment textAlign;
  const StoreInfoCard({
    Key? key,
    required this.infoList,
    this.textAlign = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: fydSblack,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: textAlign,
            children: List.generate(infoList.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  infoList.elementAt(index),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: fydSgrey,
                      fontFamily: body12.fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
