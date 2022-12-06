import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../00 ui-core/ui_exports.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../03 domain/store/00_export_store_domain.dart';

class MockUi {
  //! database stores doc
  static Store store = const Store(
      sId: '#A32',
      docId: '',
      isLive: true,
      name: 'Store Name #',
      categories: ['APPARELS', 'FOOTWEAR'],
      types: {},
      socialPresence: {},
      rating: 4.2,
      about:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has",
      storeImages: [],
      storeLogo: '',
      storeAddress: {
        'default':
            '117  Mint Road Nr Fort Market Ballard Estate, Mumbai, 400038, India'
      },
      storeContact: {'default': '5652683626'},
      // products: {},
      productsRef: '');

  //! database product doc
  static Product product = const Product(
    skuId: '#W234',
    name: 'Product Name #',
    storeId: '#R53',
    category: 'APPAREL',
    type: 'SHIRT',
    company: 'Product Company Name',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
    sizeAvailability: {
      'M': 2,
      'L': 2,
    },
    productRef: '',
    sizeGuide: '',
    qty: 4,
    sellingPrice: 54.34,
    mrp: 60.0,
    productImages: [],
    popularity: 1,
    inStock: true,
  );

  //! orders ui
  static List<String> orderInfo = [
    '#52242',
    'Store Name too long',
    '3',
    '59.32',
    '21/02/2022',
    'Processing',
    'W213'
  ];
  //! confirmation ui
  static String confirmGif =
      'https://cdn.dribbble.com/users/7213458/screenshots/19652208/media/acf8bfaf5c03d8c430a8e35ff02f49ec.gif';
  //! newAddress ui
  static List<String> states = [
    'Select state',
    'Uttar Pradesh',
    'Punjab',
    'Haryana'
  ];
  //! deliveryinfo ui
  static List<String> deliveryAddress = [
    'Lakshya Singh',
    '8938938932',
    '117  Mint Road Nr Fort Market Ballard Estate',
    'Mumbai',
    '400038'
  ];
  //! storeinfo ui
  static String storeAddress =
      '117  Mint Road Nr Fort Market Ballard Estate, Mumbai, 400038, India';
  static String storePhone = "3219003219";
  static List<String> socialIcons = [
    'instagram.svg',
    'youtube.svg',
    'fb.svg',
    'whatsapp.svg',
    'web.svg',
  ];
  //! product ui
  static String descriptionText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has';
  static List<String> productImages = [
    'https://cdn.shopify.com/s/files/1/0536/3594/0515/products/af077daf-b2d3-8e33-2c88-08bba08962e5_cream-white-shirt-02_e08f3334-11b6-4934-8ce1-d1cb3f1bee26_1440x1800.jpg?v=1663835398',
    'https://cdn.shopify.com/s/files/1/0536/3594/0515/products/79e10fac-63d5-aae8-7de9-1f4b879f00c7_cream-white-shirt-05_0332d54a-df9e-4854-b46a-c6ad1ac3dcde_1440x1800.jpg?v=1663835398',
    'https://cdn.shopify.com/s/files/1/0536/3594/0515/products/41550b5f-9c58-ca49-6598-e9f0a14a5766_cream-white-shirt-03_b98b6dd5-b664-4d40-baeb-89e12ba1d4ad_1440x1800.jpg?v=1663835398',
  ];
  //! Cart ui
  static List<List<dynamic>> cartList = [
    // 0:name, 1:color, 2:size, 3:price, 4:qty, 5:pid
    ['Product Name #1', 'yellow', 'size 1', 27.00, 3, 'r213'],
    ['Product Name #2', 'green', 'size 2', 27.00, 2, 'r218'],
    ['Product Name #3', 'red', 'size 3', 27.00, 1, 'r212'],
    ['Product Name #4', 'mergenta blue', 'size 2', 27.00, 2, 'r215'],
    ['Product Name #5', 'redish brown', 'size 3', 27.00, 1, 'r214'],
  ];
  //! Stores ui
  static List<String> storeSorting = [
    'Popularity',
    'Newest',
    'Price: H-L',
    'Price: L-H'
  ];

  static List<Map<String, int>> categoryChipList = [
    {'Apparel': 0},
    {'Electronics': 1},
    {'Footwear': 2},
    {'Services': 2},
  ];
  static List<List<String>> storeList = [
    ['Shoppe Name #1', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #2', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #3', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #4', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #5', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #6', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #7', 'A32W', 'vivek vihar, colony 2, New Delhi'],
    ['Shoppe Name #8', 'A32W', 'vivek vihar, colony 2, New Delhi'],
  ];
  //! Home ui
  static List<Card> cardList = [
    Card(
      elevation: 20.0,
      child: SizedBox(height: 180, width: 160),
      color: fydPGrey.withOpacity(.7),
    ),
    Card(
      elevation: 20.0,
      child: SizedBox(height: 180, width: 160),
      color: fydPGrey.withOpacity(.7),
    ),
    Card(
      elevation: 20.0,
      child: SizedBox(height: 180, width: 160),
      color: fydPGrey.withOpacity(.7),
    ),
    Card(
      elevation: 20.0,
      child: SizedBox(height: 180, width: 160),
      color: fydPGrey.withOpacity(.7),
    ),
    Card(
      elevation: 20.0,
      child: SizedBox(height: 180, width: 160),
      color: fydPGrey.withOpacity(.7),
    ),
  ];
  static List<Column> categoryIconList = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          width: 60.h,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            elevation: 5.0,
            color: fydSBlue,
            child: SvgPicture.asset(
              'assets/icons/apparels.svg',
            ).paddingAll(5.r),
          ),
        ),
        FydText.b4black(
          text: 'Apparels',
          weight: FontWeight.w600,
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          width: 60.h,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            elevation: 5.0,
            color: fydSYellow,
            child: SvgPicture.asset(
              'assets/icons/electronics.svg',
            ).paddingAll(5.r),
          ),
        ),
        FydText.b4black(
          text: 'Electronics',
          weight: FontWeight.w600,
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60.h,
          width: 60.h,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            elevation: 5.0,
            color: fydSPink,
            child: SvgPicture.asset(
              'assets/icons/footwear.svg',
            ).paddingAll(5.r),
          ),
        ),
        FydText.b4black(
          text: 'Footwear',
          weight: FontWeight.w600,
        ),
      ],
    ),
  ];
  static List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  static List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: 500.w,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ).paddingSymmetric(horizontal: 5.w),
      )
      .toList();

  static Widget LogoText = Text.rich(
    TextSpan(
      text: 'veriFyd',
      style: GoogleFonts.exo2(
          textStyle: TextStyle(fontSize: 30.sp, color: fydTBlack)),
      children: <InlineSpan>[
        TextSpan(
          text: '.store',
          style: GoogleFonts.exo2(
              textStyle: TextStyle(fontSize: 30.sp, color: fydLogoGreen)),
        ),
      ],
    ),
  );
}
//! to add subcollection to each doc and then add 10 docs in each of the subcollection
  // FirebaseFirestore.instance.collection('stores').get().then((querySnapshot) {
  //     for (var docu in querySnapshot.docs) {
  //       var subCollection = FirebaseFirestore.instance
  //           .collection('stores')
  //           .doc(docu.id)
  //           .collection('products')
  //           .withConverter<Product>(
  //               fromFirestore: (snapshot, _) =>
  //                   Product.fromJson(snapshot.data()!),
  //               toFirestore: (product, _) => product.toJson());
  //       for (var i = 5; i > 0; i--) {
  //         subCollection.add(Product(
  //           skuId: '#W23${i + 10}',
  //           name: 'Product Name #${i + 10}',
  //           storeId: '#R53',
  //           category: 'APPAREL',
  //           type: 'JACKET', //'SHIRT','JACKET','PANT','SHOES'
  //           company: 'Product Company Name',
  //           description:
  //               '$i Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has',
  //           sizeAvailability: const {
  //             'M': 2,
  //             'L': 2,
  //           },
  //           sizeGuide: '',
  //           qty: 4,
  //           sellingPrice: 54.34,
  //           mrp: 60.0,
  //           productImages: [],
  //           popularity: 1,
  //         ));
  //       }
  //     }
  //     print('added');
  //   });
//! to add data to collection's document

  // FirebaseFirestore.instance.collection('stores').get().then((querySnapshot) {
  //     for (var docu in querySnapshot.docs) {
  //        docu.             
  //      }
  //   });
    

//! TO ADD STORES
    // final collection = FirebaseFirestore.instance
    //     .collection('stores')
    //     .withConverter<Store>(
    //         fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
    //         toFirestore: (store, _) => store.toJson());

    // for (var i = 5; i > 0; i--) {
    //   collection
    //       .add(Store(
    //           sId: '#A32${i }',
    //           name: 'Store Name #${i}',
    //           categories: ['APPARELS', 'FOOTWEAR','ELECTRONICS'],
    //           types: [],
    //           socialPresence: {},
    //           rating: 4.2,
    //           about:
    //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has",
    //           storeImages: [],
    //           storeLogo: '',
    //           storeAddress: {
    //             'default':
    //                 '${i} 117  Mint Road Nr Fort Market Ballard Estate, Mumbai, 400038, India'
    //           },
    //           storeContact: {'default': '${i}652683626'},
    //           products: []))
    //       .then((_) => print('Added'))
    //       .catchError((error) => print('Add failed: $error'));
    // }

