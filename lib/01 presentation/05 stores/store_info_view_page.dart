import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../03 domain/store/store.dart';
import '../../presentation/stores/sub views/store/widgets/store_name_header.dart';
import 'widgets/export_widgets.dart';

class StoreInfoViewWrapperPage extends StatelessWidget {
  const StoreInfoViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreInfoViewPage(
      store: MockUi.store,
      color: fydSPink,
    );
  }
}

class StoreInfoViewPage extends StatelessWidget {
  const StoreInfoViewPage({Key? key, required this.store, required this.color})
      : super(key: key);
  final Store store;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FydView(
      pageViewType: ViewType.with_Nav_Bar,
      isScrollable: false,
      topSheetColor: color,
      topSheetHeight: 200.h,
      topSheet: _topSheetView(context),
      bottomSheet: _bottomSheetView(context),
    );
  }

//?--Top-Sheet-view-------------------------------------------------------------
  _topSheetView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // AppBar
        FydAppBar(
          leading: Center(
            child: IconButton(
              //TODO: navigation
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30.w,
                color: Helpers.getContrastColor(color),
              ),
            ),
          ),
          main: Center(
            child: StoreNameHeader(storeName: store.name),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_outlined,
                size: 20.w,
              ),
              FydText.b3black(text: store.rating.toString()),
            ],
          ),
        ),
        // [store-about]
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.w),
          child: StoreInfoCard(infoList: [MockUi.store.about]),
        )
      ],
    );
  }

//?-----------------------------------------------------------------------------
//?--bottom-Sheet-view----------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            // Featured-In section
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Card(
                color: fydPGrey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                  child: ExpansionTile(
                    iconColor: fydSOrange,
                    collapsedIconColor: fydDustyPeach,
                    title: FydText.h3custom(
                      color: fydDustyPeach,
                      text: 'Featured-In',
                      weight: FontWeight.w600,
                    ),
                    onExpansionChanged: (bool value) {},
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, bottom: 20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Description
                            FydText.b2grey(
                              text: 'description',
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // info-section[Address + contact]
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.h2white(text: 'Address'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: StoreInfoCard(
                textAlign: CrossAxisAlignment.start,
                infoList: store.storeAddress.values.toList(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FydText.h2white(text: 'Contact us on'),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: StoreInfoCard(
                textAlign: CrossAxisAlignment.center,
                infoList: store.storeContact.values.toList(),
              ),
            ),
            // social-Media-Section
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 40.w,
                runSpacing: 15.h,
                clipBehavior: Clip.antiAlias,
                children: List.generate(MockUi.socialIcons.length, (idx) {
                  return InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/${MockUi.socialIcons[idx]}',
                      height: 30,
                      width: 30,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}
