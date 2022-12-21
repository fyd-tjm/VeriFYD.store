// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/product_page.dart';
import 'package:verifyd_store/02%20application/cart/cubit/cart_cubit.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/aa%20mock/test_store.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../03 domain/cart/cart.dart';

const String cartRef =
    'users/6yQEkmtw9uIed83psnEpkt6rw6AV/cart/4OsMh8URJm3Xyf3u9w1I';

class StartApp extends StatelessWidget {
  StartApp({Key? key}) : super(key: key);
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 890),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'testing',
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<SharedInfoCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<CartCubit>(),
                ),
              ],

              // child: const ProductWrapperPage(),
              child: const TestStoreScreen(),
            ),
          );
          // return BlocProvider(
          //   create: (context) => getIt<FydUserCubit>(),
          //   child: MaterialApp.router(
          //     title: 'veriFYD.store',
          //     routerDelegate: appRouter.delegate(
          //       navigatorObservers: () => [MainRouterObserver()],
          //     ),
          //     routeInformationParser: appRouter.defaultRouteParser(),
          //   ),
          // );
        });
  }
}

//! route observer
class MainRouterObserver extends AutoRouterObserver {
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log('replaced: ${oldRoute?.settings.name} ➡️ ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log('removed: ➡️ ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log('pushed: ➡️ ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('poped: ➡️ ${route.settings.name}');
    super.didPop(route, previousRoute);
  }
}

const store = Store(
  sId: '#W12R',
  name: 'STORE-#W12R ',
  categories: ['APPAREL'],
  types: {'SHIRT': 5},
  socialPresence: {},
  rating: 4.3,
  about: 'ABOUT THE STORE LOREM IPSUM ',
  storeImages: [],
  storeLogo: '',
  storeAddress: {},
  storeContact: {},
  productsRef: 'stores/#W12R/products',
  isLive: true,
  docId: '#W12R',
);
const product = Product(
  skuId: '#A112',
  name: 'PRODUCT-name-#A112',
  storeId: '#W12R',
  category: 'APPAREL',
  type: 'SHIRT',
  company: 'LEVIS AND CO.',
  description: 'LOREM IPSUM LALALALAL',
  sizeAvailability: {'S': 2, 'M': 2},
  sizeGuide: '',
  qty: 4,
  sellingPrice: 660,
  mrp: 800,
  productImages: [],
  productRef: '',
  popularity: 1,
  inStock: true,
);
// final FirebaseFirestore firestore = FirebaseFirestore.instance;
//     void test() async {
//       final productsRef = firestore
//           .collection('stores')
//           .doc('#W12R')
//           .collection('products')
//           .withConverter<Product>(
//               fromFirestore: (snapshot, _) =>
//                   Product.fromJson(snapshot.data()!),
//               toFirestore: (model, _) => model.toJson());

//       await productsRef
//           .doc('#A116')
//           .set(product)
//           .onError((error, stackTrace) => log(error.toString()));
//     }

//     test();