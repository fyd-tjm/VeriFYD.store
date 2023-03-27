import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as flutterHooks;
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/confirmation_page.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/shared/shared_info.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';
import 'package:verifyd_store/03%20domain/user/fyd_user.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

//?-----------------------------------------------------------------------------
class TestWrapperPage extends StatelessWidget {
  const TestWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const TestPage();
    return const ConfirmationPage(
      orderStatus: OrderStatus.failure(paymentMode: PaymentMode.online()),
    );
  }
}

//?-----------------------------------------------------------------------------
const bColor = Colors.black87;

//-------
class TestPage extends flutterHooks.HookWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state1 = flutterHooks.useState<double>(0);

    return _topSheet(context, state1);
  }

//?-----------------------------------------------------------------------------
  _topSheet(
    BuildContext context,
    ValueNotifier<double> state1,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: FydBtn(
                height: 55,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const FydText.b1white(text: 'Restart'),
                    const SizedBox(width: 100),
                    Image.asset(
                      AssetHelper.comming_soon_tag,
                      width: 100,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
                // fydText: FydText.b1white(text: 'Restart - ${state1.value}'),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  state1.value = state1.value + 1;
                },
              ),
            ))
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheet(BuildContext context, ValueNotifier<bool> state1,
      ValueNotifier<Coupon?> discount) {
    return Column(children: const []);
  }

//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------

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
                    colors: [fydABlueGrey, Colors.transparent],
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
                    colors: [fydABlueGrey, Colors.transparent],
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
          selectedColor: fydABlueGrey,
          strokeColor: Colors.transparent,
          unSelectedColor: fydBbluegrey,
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
      policy:
          'Thank you for shopping at (Store Name)! We offer refund and/or exchange within the first 30 days of your purchase, if 30 days have passed since your purchase, you will not be offered a refund and/or exchange of any kind. Your item must be unused and in the same condition that you received it.',
      sizeAvailability: const {'S': 1, 'M': 3, 'L': 2},
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
      offers: {},
      coupons: {},
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
      shippingCost: 100,
      totalOrders: 0,
      cartLimit: 10,
      liveStores: {'APPAREL': 10, 'FOOTWEAR': 5, 'OTHER': 0},
      timmings: {
        'CALLING HOURS': "09:00 - 18:00",
        'OPERATING HOURS': "09:00 - 21:00"
      },
      deliveryStates: [],
      images: {
        'LAUNCHING SOON':
            'https://cdn-icons-png.flaticon.com/512/5578/5578691.png'
      },
      support: {
        'MAIL': 'fyd.technologies@gmail.com',
        'PHONE': '+919690590197',
        'WHATSAPP': '+919690590197'
      },
      banners: {},
      offers: {},
      recentlyPurchased: {},
      storeSearchMap: {
        "#A108": "LOREM IPSUM A-108",
        "#B110": "LOREM IPSUM B-110",
        "#B111": "LOREM IPSUM B-111",
        "#B112": "LOREM IPSUM B-112",
        "#B113": "LOREM IPSUM B-113",
        "#B114": "LOREM IPSUM B-114",
        "#B115": "LOREM IPSUM B-115",
        "#B116": "LOREM IPSUM B-116",
        "#B117": "LOREM IPSUM B-117",
        "#B118": "LOREM IPSUM B-118",
        "#B210": "LOREM IPSUM B-210",
        "#B211": "LOREM IPSUM B-211",
        "#B212": "LOREM IPSUM B-212",
        "#B213": "LOREM IPSUM B-213",
        "#B214": "LOREM IPSUM B-214"
      },
      isPodAvailable: true);

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
  coupons: {},
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
  policy: '',
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
