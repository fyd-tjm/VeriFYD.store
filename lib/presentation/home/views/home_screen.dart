import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';

import '../../core/widgets/fyd_page_view.dart';
import '../../core/widgets/fyd_v_h_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //!top sheet height limit 750
  @override
  Widget build(BuildContext context) {
    return FydPageView(
      isScrollable: true,
      topSheetHeight: 420.h,
      pageViewType: PageViewType.with_Nav_Bar,
      topSheet: Column(
          // children: [
          //   //! veriFyd.store heading
          //   Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       FydText.d3black(
          //         text: 'veriFyd.store',
          //         weight: FontWeight.w100,
          //       ),
          //     ],
          //   ).paddingOnly(top: 10.h),
          //   //! Search Bar
          //   GestureDetector(
          //     onTap: () =>
          //         showSearch(context: context, delegate: DataSearch(context)),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         SizedBox(
          //           height: 60.h,
          //           width: 360.w,
          //           child: Card(
          //             elevation: 15.0,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10.r)),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 //! icon
          //                 Icon(
          //                   Icons.manage_search_sharp,
          //                   size: 32.sp,
          //                   color: fydPDgrey,
          //                 ).paddingSymmetric(horizontal: 15.w),

          //                 //! hint Text
          //                 Expanded(
          //                     child: FydText.b3grey(
          //                   text: 'Find Store via name (or) #id',
          //                 )),
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ).paddingOnly(top: 8.h),
          //   ),
          //   //! Banners
          //   SizedBox(
          //     height: 420.h / 3,
          //     width: double.infinity,
          //     child: CarouselSlider(
          //       options: CarouselOptions(
          //           aspectRatio: 3.2,
          //           enlargeCenterPage: true,
          //           scrollDirection: Axis.horizontal,
          //           autoPlay: true,
          //           viewportFraction: 0.9,
          //           enlargeStrategy: CenterPageEnlargeStrategy.height),
          //       items: MockUi.imageSliders,
          //     ),
          //   ).paddingOnly(top: 15.h),

          //   // //! Category subHeading
          //   Row(
          //     children: [
          //       FydText.b2grey(
          //         text: 'Category',
          //         weight: FontWeight.w600,
          //         color: fydPLgrey,
          //       )
          //     ],
          //   ).paddingOnly(top: 20.h, left: 15.w),
          //   //! Category list
          //   FydHListView(
          //           height: 80.h,
          //           separation: 35.w,
          //           itemCount: MockUi.categoryIconList.length,
          //           listWidget: MockUi.categoryIconList)
          //       .paddingOnly(top: 10.h),
          // ],
          ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! RecentlyPurchased subHeading
          Row(
            children: [
              FydText.h3white(
                text: 'Recently Purchased',
                weight: FontWeight.w300,
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w, vertical: 20.h),
          //! RecentlyPurchased List
          FydHListView(
                  height: 180.h,
                  separation: 15.w,
                  itemCount: 5,
                  listWidget: MockUi.cardList)
              .paddingOnly(bottom: 20.h),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  final BuildContext parentContext;
  // final Logger logger = new Logger();

  DataSearch(this.parentContext)
      : super(
          keyboardType: TextInputType.visiblePassword,
          searchFieldLabel: 'Find Store via name (or) #id',
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
