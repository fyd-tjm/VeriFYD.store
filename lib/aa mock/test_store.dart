import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:verifyd_store/01%20presentation/04%20home/home_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/stores_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_info_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_view_page.dart';
import 'package:verifyd_store/01%20presentation/06%20cart/cart_view_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_view_page.dart';

import '../01 presentation/00 core/widgets/00_core_widgets_export.dart';

class TestStoreScreen extends StatefulWidget {
  const TestStoreScreen({Key? key}) : super(key: key);

  @override
  State<TestStoreScreen> createState() => _TestStoreScreenState();
}

class _TestStoreScreenState extends State<TestStoreScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better perfomance
      extendBody: true,
      backgroundColor: fydPblack,

      body: const SafeArea(
        child: HomeViewPage(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 65.5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 192, 174, 174),
                        Colors.transparent
                      ],
                      begin: Alignment.center,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 192, 174, 174),
                        Colors.transparent
                      ],
                      begin: Alignment.center,
                      end: Alignment.centerRight,
                    ),
                  ),
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ],
            ),
          ),
          CustomNavigationBar(
            elevation: 8,
            iconSize: 35.h,
            selectedColor: fydPwhite,
            strokeColor: Colors.transparent,
            unSelectedColor: fydSgrey,
            backgroundColor: fydPblack,
            scaleFactor: 0.2,
            scaleCurve: Curves.elasticOut,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home),
                title: Text('', style: TextStyle(fontSize: 8.h)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.storefront_sharp),
                title: Text('', style: TextStyle(fontSize: 8.h)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart),
                title: Text('', style: TextStyle(fontSize: 8.h)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.account_circle),
                title: Text('', style: TextStyle(fontSize: 8.h)),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              HapticFeedback.mediumImpact();
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
