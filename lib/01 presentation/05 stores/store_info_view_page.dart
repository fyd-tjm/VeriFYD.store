import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../03 domain/store/store.dart';

//?-----------------------------------------------------------------------------

class StoreInfoViewWrapperPage extends StatelessWidget {
  const StoreInfoViewWrapperPage({Key? key, required this.store})
      : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return StoreInfoViewPage(
      store: store,
    );
  }
}

//?-----------------------------------------------------------------------------

class StoreInfoViewPage extends StatelessWidget {
  const StoreInfoViewPage({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 200.h,
          topSheet: _topSheetView(context),
          bottomSheet: _bottomSheetView(context),
        ),
      ),
    );
  }

//?--Top-Sheet-view-------------------------------------------------------------
  _topSheetView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar
        FydAppBar(
          leading: AppBarBtn(
              iconData: FontAwesomeIcons.arrowLeftLong,
              iconSize: 20,
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                HapticFeedback.lightImpact();
                context.router.pop();
              }),
          main: Center(
            child: FydAutoScrollingText(
                width: 300.w,
                height: 50.h,
                velocity: 10,
                fydText: FydText.h3custom(
                  text: store.name,
                  color: fydPGrey,
                )),
          ),
        ),
        //! [store-about]
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.w),
          child: FydTextCard(
            backgroundColor: fydPLgrey,
            message: store.about,
            textColor: fydTGrey,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            onTap: () async {
              await showModal<bool>(
                context: context,
                configuration: const FadeScaleTransitionConfiguration(
                  barrierDismissible: true,
                ),
                useRootNavigator: false,
                builder: (context) => FydCloseDialog(
                  message: store.about,
                  onClose: () => Navigator.of(context).pop(true),
                ),
              );
            },
          ),
        )
      ],
    );
  }

//?--bottom-Sheet-view----------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    //-------
    String? facebook =
        store.socialPresence[DbHelpers.getStoreInfoField(StoreInfo.facebook)];
    String? instagram =
        store.socialPresence[DbHelpers.getStoreInfoField(StoreInfo.instagram)];
    String? youtube =
        store.socialPresence[DbHelpers.getStoreInfoField(StoreInfo.youtube)];
    String? whatsapp =
        store.socialPresence[DbHelpers.getStoreInfoField(StoreInfo.whatsapp)];
    String? website =
        store.socialPresence[DbHelpers.getStoreInfoField(StoreInfo.website)];
    //-------
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            //! social-Links
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //! FaceBook
                  if (facebook != null && facebook.isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        await Helpers.launchLink(url: facebook);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 30,
                        color: fydLogoBlue,
                      ),
                    ),
                  //! Instagram
                  if (instagram != null && instagram.isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        await Helpers.launchLink(url: instagram);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                        color: fydLogoBlue,
                      ),
                    ),
                  //! Youtube
                  if (youtube != null && youtube.isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        await Helpers.launchLink(url: youtube);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const FaIcon(
                        FontAwesomeIcons.youtube,
                        size: 30,
                        color: fydLogoBlue,
                      ),
                    ),
                  //! Whatsapp
                  if (whatsapp != null && whatsapp.isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        await Helpers.launchWhatsApp(phone: whatsapp);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 30,
                        color: fydLogoBlue,
                      ),
                    ),
                  //! web
                  if (website != null && website.isNotEmpty)
                    IconButton(
                      onPressed: () async {
                        await Helpers.launchLink(url: website);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const FaIcon(
                        FontAwesomeIcons.globe,
                        size: 30,
                        color: fydLogoBlue,
                      ),
                    ),
                ],
              ),
            ),
            //! Featured-In
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
              child: StoreInfoExpansionTile(
                  title: 'Featured-In',
                  color: fydLogoBlue,
                  widgets: List.generate(store.featuredIn.length, (index) {
                    final featuredInList = store.featuredIn.values.toList()
                      ..reversed;
                    return FydTextCard(
                      message: featuredInList.elementAt(index),
                      onTap: () async {
                        Helpers.launchLink(
                          url: featuredInList.elementAt(index),
                        );
                      },
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textColor: fydBlueGrey,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.w),
                    );
                  })),
            ),
            //! Address-es
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: StoreInfoExpansionTile(
                  title: 'Address-(es)',
                  expanded: true,
                  color: fydLogoBlue,
                  widgets: List.generate(
                    store.storeAddress.length,
                    (index) => FydTextCard(
                      message: store.storeAddress.values.elementAt(index),
                      textColor: fydBlueGrey,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.w),
                    ),
                  )),
            ),
            //! contacts
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: StoreInfoExpansionTile(
                  title: 'Contact us on: ',
                  color: fydLogoBlue,
                  widgets: List.generate(
                    store.storeContact.length,
                    (index) => FydTextCard(
                      message: Helpers.phoneMaskWithCountryCode(
                          store.storeContact.values.elementAt(index)),
                      onTap: () async {
                        Helpers.launchPhone(
                          phone: store.storeContact.values.elementAt(index),
                        );
                      },
                      textColor: fydBlueGrey,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.w),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}

class StoreInfoExpansionTile extends StatelessWidget {
  const StoreInfoExpansionTile({
    Key? key,
    required this.title,
    this.titleSize = 22,
    required this.color,
    this.expanded = false,
    required this.widgets,
  }) : super(key: key);

  final String title;
  final double titleSize;
  final Color color;
  final bool expanded;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ExpansionTile(
        initiallyExpanded: expanded,
        backgroundColor: fydPGrey,
        collapsedBackgroundColor: fydPGrey,
        iconColor: fydTGrey,
        collapsedIconColor: color,
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        title: FydText.h3custom(
          color: color,
          size: titleSize,
          text: title,
          weight: FontWeight.w600,
        ),
        children: widgets,
      ),
    );
  }
}
