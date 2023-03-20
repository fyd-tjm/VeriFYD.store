import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class ProductSizeTile extends StatelessWidget {
  const ProductSizeTile({
    Key? key,
    required this.size,
    required this.tileColor,
    required this.onPressed,
  }) : super(key: key);
  final String size;
  final Color tileColor;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 70.w,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onPressed(size);
        },
        child: Card(
          color: tileColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(child: FydText.b1custom(text: size, color: fydPwhite)),
        ),
      ),
    );
  }
}
