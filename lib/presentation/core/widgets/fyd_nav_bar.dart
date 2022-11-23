import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/core/ui%20controller/home_root_nav_controller.dart';

import '../../../utils/router/routes.dart';

class FydNavBar extends StatelessWidget {
  const FydNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: fydPDgrey,
        border: Border.all(color: fydPGrey, width: 2.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! HOME
          IconButton(
            onPressed: () => HomeRootNavController.i.updateIndex(0),
            icon: const Icon(Icons.home_sharp),
            padding: EdgeInsets.all(22.h),
            iconSize: 28.h,
            color: fydPLgrey,
            disabledColor: fydPWhite,
            splashColor: Colors.transparent,
            // splashRadius: Material.defaultSplashRadius,
          ),
          //! STORES
          IconButton(
            onPressed: () => HomeRootNavController.i.updateIndex(1),
            icon: const Icon(Icons.storefront_sharp),
            padding: EdgeInsets.all(22.h),
            iconSize: 28.h,
            color: fydPLgrey,
            disabledColor: fydPWhite,
            splashColor: Colors.transparent,
          ),
          //! CART
          IconButton(
            onPressed: () => HomeRootNavController.i.updateIndex(2),
            icon: const Icon(Icons.shopping_cart_sharp),
            padding: EdgeInsets.all(22.h),
            iconSize: 28.h,
            color: fydPLgrey,
            disabledColor: fydPWhite,
            splashColor: Colors.transparent,
          ),
          //! PROFILE
          IconButton(
            onPressed: () => HomeRootNavController.i.updateIndex(3),
            icon: const Icon(Icons.person_sharp),
            padding: EdgeInsets.all(22.h),
            iconSize: 32.h,
            color: fydPLgrey,
            disabledColor: fydPWhite,
            splashColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
