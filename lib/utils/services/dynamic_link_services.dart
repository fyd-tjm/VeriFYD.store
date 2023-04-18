import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';

@lazySingleton
class DynamicLinkService {
  Future handleDynamicLinks() async {
    //  if the app is opened with a dynamic link
    final data = await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data);

    // if the app is opened up from the background
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) async {
      _handleDeepLink(dynamicLink);
    }, onError: (e) async {
      log('Link Failed: ${e.message}');
    });
  }

  String extractStoreIdFromLink(String link) {
    String storeId = link.substring(link.indexOf("#"));
    return storeId;
  }

  void _handleDeepLink(PendingDynamicLinkData? data) {
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      final storeId = extractStoreIdFromLink(deepLink.toString());
      log('_handleDeepLink | deeplink: $storeId');
      getIt<AppRouter>().navigate(
        StoresRouter(
          children: [
            const StoresViewWrapperRoute(),
            StoreViewWrapperRoute(storeId: storeId),
          ],
        ),
      );
    }
  }
}
