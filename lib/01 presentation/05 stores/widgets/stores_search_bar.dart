import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/widgets/store_search.dart';

import '../../../00 ui-core/ui_exports.dart';

class StoresSearchBar extends StatelessWidget {
  const StoresSearchBar({
    Key? key,
    required this.searchMap,
    required this.recentMap,
    required this.onResultTap,
  }) : super(key: key);
  final Map<String, String> searchMap;
  final Map<String, String> recentMap;
  final void Function(MapEntry<String, String>) onResultTap;

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      height: 55.h,
      width: double.infinity,
      color: fydPblack,
      onPressed: () async {
        HapticFeedback.mediumImpact();
        await showCustomSearch(
          context: context,
          delegate: StoreSearch(
            context: context,
            searchMap: searchMap,
            recentMap: recentMap,
            onTap: onResultTap,
          ),
        );
      },
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //! icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Icon(
              Icons.manage_search_sharp,
              size: 32.sp,
              color: fydBblue,
            ),
          ),
          //! hint Text
          const Expanded(
            child: FydRichText(
              size: 15,
              color: fydBbluegrey,
              weight: FontWeight.w600,
              letterSpacing: .9,
              textList: [
                TextSpan(
                  text: 'find store via ',
                ),
                TextSpan(
                    text: '#',
                    style: TextStyle(
                        color: fydPwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                    text: 'store-id',
                    style: TextStyle(color: fydBbluegrey, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
