import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

import '../../../../core/widgets/fyd_text_scroller.dart';

class StoreNameHeader extends StatelessWidget {
  final String storeName;
  const StoreNameHeader({
    Key? key,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (storeName.length < 14)
        ? FydText.d2black(text: storeName)
        : FydTextScroller(
            height: 40.h,
            width: 400.h * (2 / 3),
            fydText: FydText.d2black(text: storeName),
          );
  }
}
