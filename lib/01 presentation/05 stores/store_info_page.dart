import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_close_dialog.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_text_card.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../03 domain/store/store.dart';
import 'widgets/store_info_expansion_tile.dart';

//?-----------------------------------------------------------------------------

class StoreInfoWrapperPage extends StatelessWidget {
  const StoreInfoWrapperPage({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return StoreInfoPage(
      store: store,
    );
  }
}

//?-----------------------------------------------------------------------------

class StoreInfoPage extends StatelessWidget {
  const StoreInfoPage({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 200.h,
          topSheet: _TopSheet(store: store),
          bottomSheet: _BottomSheet(store: store),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class _TopSheet extends StatelessWidget {
  const _TopSheet({
    required this.store,
  });

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar
        FydAppBar(
          leading: AppBarBtn.back(onPressed: () {
            context.router.pop();
          }),
          main: Center(
            child: FydAutoScrollingText(
                width: 300.w,
                height: 50,
                velocity: 10,
                fydText: FydText.h3custom(
                  text: store.name,
                  color: fydSblack,
                )),
          ),
        ),
        //! [store-about]
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.w),
          child: FydTextCard(
            backgroundColor: fydSgrey,
            message: store.about,
            textColor: fydABlueGrey,
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
}

//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final Store store;
  const _BottomSheet({
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    //-------
    String? facebook = store
        .socialPresence[DbHelpers.getStoreInfoField(StoreInfoFields.facebook)];
    String? instagram = store
        .socialPresence[DbHelpers.getStoreInfoField(StoreInfoFields.instagram)];
    String? youtube = store
        .socialPresence[DbHelpers.getStoreInfoField(StoreInfoFields.youtube)];
    String? whatsapp = store
        .socialPresence[DbHelpers.getStoreInfoField(StoreInfoFields.whatsapp)];
    String? website = store
        .socialPresence[DbHelpers.getStoreInfoField(StoreInfoFields.website)];
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
                        color: fydBgreen,
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
                        color: fydBgreen,
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
                        color: fydBgreen,
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
                        color: fydBgreen,
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
                        color: fydBgreen,
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
                  color: fydBblue,
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
                      textColor: fydBbluegrey,
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
                  color: fydBblue,
                  widgets: List.generate(
                    store.storeAddress.length,
                    (index) => FydTextCard(
                      message: store.storeAddress.values.elementAt(index),
                      textColor: fydBbluegrey,
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
                  color: fydBblue,
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
                      textColor: fydBbluegrey,
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
}

//?-----------------------------------------------------------------------------
