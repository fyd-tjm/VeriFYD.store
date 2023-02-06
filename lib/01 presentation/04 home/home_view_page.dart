import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';

import '../00 core/widgets/00_core_widgets_export.dart';

//?-----------------------------------------------------------------------------

class HomeViewWrapperPage extends StatelessWidget {
  const HomeViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeViewPage();
  }
}

//?-----------------------------------------------------------------------------

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FydView(
        pageViewType: ViewType.with_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 420.h,
        topSheet: _topSheetView(context),
        bottomSheet: _bottomSheetView(),
      ),
    );
  }

//?--topSheetView---------------------------------------------------------------
  Widget _topSheetView(BuildContext context) {
    return Column(
      children: [
        // appBar
        const FydAppBar(
          main: Center(
            child: FydText.d3black(
              text: "veriFYD.store",
              weight: FontWeight.w500,
            ),
          ),
        ),
        //todo search section
        GestureDetector(
          onTap: () =>
              showSearch(context: context, delegate: DataSearch(context)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
                width: 380.w,
                child: Card(
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
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
                          color: fydPDgrey,
                        ),
                      ),

                      //! hint Text
                      const Expanded(
                          child: FydText.b3custom(
                        text: 'Find Store via name (or) #id',
                        weight: FontWeight.w600,
                        color: fydTGrey,
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //todo banner section
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SizedBox(
            height: 420.h / 3,
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                  // aspectRatio: 3.2,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: MockUi.imageSliders,
            ),
          ),
        ),
        //todo category Heading
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 15.w),
          child: Row(
            children: const [
              FydText.b2custom(
                text: 'Category',
                weight: FontWeight.w600,
                color: fydTGrey,
              )
            ],
          ),
        ),
        //todo category Section list
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _homeCategoryCard(
                  svgAsset: 'assets/icons/apparels.svg', title: 'Apparels'),
              _homeCategoryCard(
                  svgAsset: 'assets/icons/electronics.svg',
                  title: 'Electronics'),
              _homeCategoryCard(
                  svgAsset: 'assets/icons/footwear.svg', title: 'Footwear'),
            ],
          ),
        ),
        //? testing
        // _homeCategoryCard(
        //     svgAsset: 'assets/icons/apparels.svg', title: 'Apparels'),
      ],
    );
  }

//?--bottomSheetView------------------------------------------------------------
  Widget _bottomSheetView() {
    return Column();
  }
//?-----------------------------------------------------------------------------
}

//! home-category-card [90.h]
Widget _homeCategoryCard({required String svgAsset, required String title}) {
  return SizedBox(
    height: 90.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70.h,
          width: 70.h,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            elevation: 8.0,
            color: fydSBlue,
            child: Padding(
              padding: EdgeInsets.all(5.r),
              child: SvgPicture.asset(
                svgAsset,
              ),
            ),
          ),
        ),
        FydText.b4black(
          text: title,
          weight: FontWeight.w600,
        )
      ],
    ),
  );
}

//! search
class DataSearch extends SearchDelegate {
  final BuildContext parentContext;

  DataSearch(this.parentContext)
      : super(
          keyboardType: TextInputType.visiblePassword,
          searchFieldLabel: 'Find Store via name (or) #id',
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
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
        //Todo back navigation
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
