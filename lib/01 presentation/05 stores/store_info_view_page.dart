import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../03 domain/store/store.dart';
import '../../presentation/stores/sub views/store/widgets/store_name_header.dart';

//?-----------------------------------------------------------------------------

class StoreInfoViewWrapperPage extends StatelessWidget {
  const StoreInfoViewWrapperPage(
      {Key? key, required this.store, required this.color})
      : super(key: key);
  final Store store;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return StoreInfoViewPage(
      store: store,
      color: color,
    );
  }
}

//?-----------------------------------------------------------------------------

class StoreInfoViewPage extends StatelessWidget {
  const StoreInfoViewPage({Key? key, required this.store, required this.color})
      : super(key: key);
  final Store store;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetColor: color,
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
          leading: Center(
            child: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(
                Icons.close_rounded,
                size: 35.w,
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
        //! [store-about]
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.w),
          child: FydTextCard(
            message: store.about,
            textColor: Helpers.getContrastColor(color),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          ),
        )
      ],
    );
  }

//?--bottom-Sheet-view----------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    //-------
    String? facebook = store.socialPresence['FACEBOOK'];
    String? instagram = store.socialPresence['INSTAGRAM'];
    String? youtube = store.socialPresence['YOUTUBE'];
    String? whatsapp = store.socialPresence['WHATSAPP'];
    String? website = store.socialPresence['WEBSITE'];
    //-------
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  // TODO: Featured-In StoreInfo
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                    child: StoreInfoExpansionTile(
                        title: 'Featured-In',
                        color: color,
                        widgets: List.generate(
                          2,
                          (index) => FydTextCard(
                            message:
                                "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
                            onTap: () async {
                              Helpers.launchLink(
                                  url:
                                      "https://www.youtube.com/watch?v=dQw4w9WgXcQ");
                            },
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textColor: fydBlueGrey,
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.w),
                          ),
                        )),
                  ),
                  //! Address-es
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: StoreInfoExpansionTile(
                        title: 'Address-(es)',
                        expanded: true,
                        color: color,
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
                        color: color,
                        widgets: List.generate(
                          store.storeContact.length,
                          (index) => FydTextCard(
                            message: Helpers.phoneMaskWithCountryCode(
                                store.storeContact.values.elementAt(index)),
                            onTap: () async {
                              Helpers.launchPhone(
                                phone:
                                    store.storeContact.values.elementAt(index),
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
          ),
        ),
        //! social-Links
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //! FaceBook
              if (facebook != null)
                IconButton(
                  onPressed: () async {
                    await Helpers.launchLink(url: facebook);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: fydBlueGrey,
                  ),
                ),
              //! Instagram
              if (instagram != null)
                IconButton(
                  onPressed: () async {
                    await Helpers.launchLink(url: instagram);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 30,
                    color: fydBlueGrey,
                  ),
                ),
              //! Youtube
              if (youtube != null)
                IconButton(
                  onPressed: () async {
                    await Helpers.launchLink(url: youtube);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const FaIcon(
                    FontAwesomeIcons.youtube,
                    size: 30,
                    color: fydBlueGrey,
                  ),
                ),
              //! Whatsapp
              if (whatsapp != null)
                IconButton(
                  onPressed: () async {
                    await Helpers.launchWhatsApp(phone: whatsapp);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    size: 30,
                    color: fydBlueGrey,
                  ),
                ),
              //! web
              if (website != null)
                IconButton(
                  onPressed: () async {
                    await Helpers.launchLink(url: website);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const FaIcon(
                    FontAwesomeIcons.globe,
                    size: 30,
                    color: fydBlueGrey,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
//?-----------------------------------------------------------------------------
}

class StoreInfoExpansionTile extends StatelessWidget {
  const StoreInfoExpansionTile({
    Key? key,
    required this.title,
    required this.color,
    this.expanded = false,
    required this.widgets,
  }) : super(key: key);

  final String title;
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
        iconColor: Helpers.getContrastColor(color),
        collapsedIconColor: color,
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        title: FydText.h3custom(
          color: color,
          text: title,
          weight: FontWeight.w600,
        ),
        children: widgets,
      ),
    );
  }
}
