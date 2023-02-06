import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as flutterHooks;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/03%20main%20root/main_page.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/shared/shared_info.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/03%20domain/user/fyd_user.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

//?-----------------------------------------------------------------------------
class TestWrapperPage extends StatelessWidget {
  const TestWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TestPage();
  }
}

//?-----------------------------------------------------------------------------
const bColor = Colors.black87;

//-------
class TestPage extends flutterHooks.HookWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state1 = flutterHooks.useState(true);
    return Scaffold(
      backgroundColor: bColor,
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.with_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 400.h,
          topSheetColor: fydPDgrey,
          topSheet: _topSheet(context, state1),
          bottomSheet: _bottomSheet(context, state1),
        ),
      ),
      bottomNavigationBar: builBottomNavigationBar(
        context: context,
        currentIndex: 1,
        onTap: (v) {},
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheet(BuildContext context, ValueNotifier<bool> state1) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // FydText.b1custom(
        //   text: 'testing long.text',
        //   color: fydLogoBlue,
        //   isSelectable: true,
        // ),
        // FydRichText(
        //   textList: [
        //     TextSpan(
        //         text: 'testing ',
        //         style: TextStyle(color: fydLogoPurple)),
        //     TextSpan(
        //       text: 'long',
        //     ),
        //     TextSpan(
        //         text: '.test', style: TextStyle(color: fydNotifGreen)),
        //   ],
        //   size: 18,
        //   color: fydLogoBlue,
        //   isSelectable: true,
        //   letterSpacing: 1.5,
        // ),
        // FydEllipsisText(
        //   width: 200,
        //   fydText: FydText.b1custom(
        //     text: 'testing long.text for Ellipsis',
        //     color: fydLogoBlue,
        //     isSelectable: true,
        //     letterSpacing: 1.3,
        //   ),
        // ),
        // FydAutoScrollingText(
        //   fydText: FydText.b1custom(
        //     text: 'testing long.text for Ellipsis',
        //     color: fydLogoBlue,
        //     isSelectable: true,
        //     letterSpacing: 1.3,
        //   ),
        //   width: 200,
        //   height: 60,
        //   rounds: 2,
        //   velocity: 20,
        // ),
        // // autoscroll
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 70,
        //       child: AnimatedTextKit(
        //         animatedTexts: [
        //           ColorizeAnimatedText(
        //             'veriFYD',
        //             textStyle: GoogleFonts.exo2(
        //               fontSize: 34.0,
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               letterSpacing: 1.1,
        //             ),
        //             colors: [fydLogoBlue, fydSCBlueGrey, fydBlueGrey],
        //             speed: const Duration(milliseconds: 400),
        //           ),
        //         ],
        //         totalRepeatCount: 1,
        //         repeatForever: false,
        //         pause: const Duration(milliseconds: 1000),
        //         onNext: (p0, p1) => state1.value = !state1.value,
        //       ),
        //     ),
        //     (state1.value)
        //         ? const SizedBox.shrink()
        //         : SizedBox(
        //             height: 70,
        //             child: AnimatedTextKit(
        //               animatedTexts: [
        //                 TypewriterAnimatedText('.store',
        //                     textStyle: GoogleFonts.exo2(
        //                         fontSize: 34.0,
        //                         color: fydLogoGreen,
        //                         fontWeight: FontWeight.w500,
        //                         letterSpacing: 1.1),
        //                     speed: const Duration(milliseconds: 90),
        //                     cursor: '_'),
        //               ],
        //               totalRepeatCount: 1,
        //               repeatForever: false,
        //             ),
        //           ),
        //   ],
        // )
        //?----------
        SizedBox(
          // height: ,
          child: Image.network(
            'https://s9.gifyu.com/images/splash.gif',
            filterQuality: FilterQuality.high,
            // scale: 4,
            height: 300,
            fit: BoxFit.fitHeight,
            repeat: ImageRepeat.repeat,
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheet(BuildContext context, ValueNotifier<bool> state1) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        FydBtn(
          onPressed: () async {
            HapticFeedback.heavyImpact();
            context.router.pushNamed('test2');
          },
          height: 60.h,
          color: fydSCBlueGrey,
          isFilled: false,
          fillColor: fydPDgrey,
          splashColor: fydSCBlueGrey,
          fydText: const FydText.b1custom(
            text: 'on-Press',
            color: fydSCBlueGrey,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
}

//?-----------------------------------------------------------------------------
//! bottom nav bar
Widget builBottomNavigationBar({
  required BuildContext context,
  required int currentIndex,
  required Function(int) onTap,
}) {
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
                    colors: [fydSCBlueGrey, Colors.transparent],
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
                    colors: [fydSCBlueGrey, Colors.transparent],
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
          selectedColor: fydSCBlueGrey,
          strokeColor: Colors.transparent,
          unSelectedColor: fydBlueGrey,
          backgroundColor: fydPDgrey,
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
          currentIndex: currentIndex,
          onTap: (index) {
            HapticFeedback.mediumImpact();
            onTap(index);
          },
        ),
      ],
    ),
  );
}

//?-----------------------------------------------------------------------------
//! sharedInfo-orderIds
void dbOrderIds() async {
  final fire = FirebaseFirestore.instance;
  final docRef = fire.collection('shared-info').doc('order-ids');

  final idList = Helpers.generateOrderIdList(['A-0'], 4);
  idList.removeRange(100, 9000);

  await docRef
      .set({'docType': 'main', 'ids': idList})
      .then((value) => log('success'))
      .onError((error, stackTrace) => log(error.toString()));
}

//?-----------------------------------------------------------------------------
//! products
void dbProducts() async {
  final fire = FirebaseFirestore.instance;
  final productCollRef =
      fire.collection('stores').doc('#A108').collection('products');
  for (var i = 0; i < 12; i++) {
    final x = i + 10;
    final sku = '#10$x';
    final sku2 = '#20$x';
    final name = 'Navi Blue collered Prinited desing 10$x';
    final name2 = 'Black Hoodie Plane desing 20$x';
    final prod = Product(
      skuId: sku2,
      name: name2,
      storeId: '#A108',
      storeName: 'LOREM IPSUM A-108',
      category: 'APPAREL',
      type: 'HOODIE',
      company: 'H&M CLOTHINGS @INC.',
      description:
          'A product description is the marketing copy that explains what a product is and why its worth purchasing.',
      sizeAvailability: {'S': 1, 'M': 3, 'L': 2},
      sizeGuide: '',
      sellingPrice: 950,
      mrp: 2100,
      productImages: const [
        'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F62%2Fae%2F62ae13df726656b92afa7815854e1b1741f5122e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
        'https://www.levi.in/dw/image/v2/BBRC_PRD/on/demandware.static/-/Sites-LeviMaster-Catalog/en_IN/dwe23187ff/images/hi-res/746370083/746370083_04.jpg?sw=451&sh=600'
      ],
      thumbnailImage:
          'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F62%2Fae%2F62ae13df726656b92afa7815854e1b1741f5122e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D',
      inStock: true,
      popularity: 1,
    );

    await productCollRef
        .doc(sku2)
        .set(prod.toJson())
        .then((value) => log('success'))
        .onError((error, stackTrace) => log(error.toString()));
  }
}

//?-----------------------------------------------------------------------------
//! stores
void dbStores() async {
  final fire = FirebaseFirestore.instance;
  final storesCollRef = fire.collection('stores');

  for (var i = 0; i < 5; i++) {
    var x = i + 10;
    final storeId = '#B2$x';
    final storeName = 'LOREM IPSUM B-2$x';

    final store = Store(
      storeId: storeId,
      name: storeName,
      categories: ['FOOTWEAR'],
      types: {},
      socialPresence: {
        'YOUTUBE': 'https://www.youtube.com/@flutterdev',
        'INSTAGRAM': 'https://www.instagram.com/p/Ckhm1hHoIQM',
        'WHATSAPP': '+919746262656',
      },
      featuredIn: {0: 'https://www.youtube.com/watch?v=JFm_89xDM_k'},
      rating: 0,
      about:
          'Caching finalized dependency graph completed, Caching finalized dependency graph completed!',
      storeLogo:
          'https://cdn.logojoy.com/wp-content/uploads/2018/05/30142254/125-768x591.png',
      storeAddress: {0: MockUi.storeAddress},
      storeContact: {
        0: '+919567523683',
        1: '+914567523683',
      },
      isLive: true,
      offers: {
        'FIRST-3UY':
            'Get Free Shipping on your first purchase with us. Available only for limited time'
      },
      storeAlerts: {
        0: 'Now you can get Cash on Delivery as a payment mode. Added another layer of Trust'
      },
    );

    await storesCollRef
        .doc(storeId)
        .set(store.toJson())
        .then((value) => log('success'))
        .onError((error, stackTrace) => log(error.toString()));
  }
}

//?-----------------------------------------------------------------------------
//! void user
void dbUser() async {
  final fire = FirebaseFirestore.instance;
  final docRef = fire.collection('users').doc('6yQEkmtw9uIed83psnEpkt6rw6AV');

  final fydUser = FydUser(
    uId: '6yQEkmtw9uIed83psnEpkt6rw6AV',
    phone: '+919690590197',
    name: 'tester 1',
    email: 'testing@email.com',
    addresses: {0: MockUi.fydAddress},
  );

  final result1 = await docRef
      .set(fydUser.toJson())
      .then((value) => right<int, int>(1))
      .onError((error, stackTrace) => left(0));
  result1.fold(
    (l) => null,
    (r) async {
      await docRef
          .collection('cart')
          .doc('0')
          .set(Cart.initial().toJson())
          .then((value) => log('success'));
    },
  );
}

//?-----------------------------------------------------------------------------
//! sharedInfo-user
void dbSharedInfo() async {
  final fire = FirebaseFirestore.instance;
  final docRef = fire.collection('shared-info').doc('user');

  const sharedInfo = SharedInfo(
    categories: {
      'APPAREL': 'assets/icons/apparels.svg',
      'ELECTRONICS': 'assets/icons/electronics.svg',
      'FOOTWEAR': 'assets/icons/footwear.svg',
    },
    shippingCost: 100,
    totalOrders: 0,
    cartLimit: 10,
    liveStores: {'APPAREL': 10, 'FOOTWEAR': 5, 'ELECTRONICS': 0},
    timmings: {
      'CALLING HOURS': "09:00 - 18:00",
      'OPERATING HOURS': "09:00 - 21:00"
    },
    images: {
      'COMING SOON': 'https://cdn-icons-png.flaticon.com/512/5578/5578691.png'
    },
    support: {
      'MAIL': 'fyd.technologies@gmail.com',
      'PHONE': '+919690590197',
      'WHATSAPP': '+919690590197'
    },
    banners: {},
    offers: {},
  );

  await docRef
      .set(sharedInfo.toJson())
      .then((value) => log('success'))
      .onError((error, stackTrace) => log(error.toString()));
}
//?-----------------------------------------------------------------------------

//! trash
const store = Store(
  storeId: '#W12R',
  name: 'STORE-#W12R ',
  categories: ['APPAREL'],
  types: {'SHIRT': 5},
  socialPresence: {},
  rating: 4.3,
  about: 'ABOUT THE STORE LOREM IPSUM ',
  storeLogo: '',
  storeAddress: {},
  storeContact: {},
  isLive: true,
  offers: {},
  storeAlerts: {},
  featuredIn: {},
);
const product = Product(
  skuId: '#A112',
  name: 'PRODUCT-name-#A112',
  storeId: '#W12R',
  storeName: '',
  category: 'APPAREL',
  type: 'SHIRT',
  company: 'LEVIS AND CO.',
  description: 'LOREM IPSUM LALALALAL',
  sizeAvailability: {'S': 2, 'M': 2},
  sizeGuide: '',
  sellingPrice: 660,
  mrp: 800,
  productImages: [],
  popularity: 1,
  inStock: true,
  thumbnailImage: '',
);
//?-----------------------------------------------------------------------------
