// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:group_button/group_button.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_misc_widgets.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
// import 'package:verifyd_store/application/stores/product_ui_controller.dart';
// import 'package:verifyd_store/utils/helpers/logger.dart';
// import 'package:verifyd_store/utils/router/routes.dart';

// import '../../../../core/widgets/fyd_dropdown_section.dart';
// import '../widgets/product_carousel_slider.dart';
// import '../widgets/product_size_group_btn.dart';

// class ProductScreen extends StatelessWidget {
//   ProductScreen({Key? key}) : super(key: key);
// //?-----------------------------------------------------------------------------
//   final _uiController = ProductUiController.i;
//   final logger = getLogger('ProductScreen');
// //?-----------------------------------------------------------------------------
//   @override
//   Widget build(BuildContext context) {
//     logger.w(_uiController.product.productImages.isEmpty.toString());
//     return FydPageView(
//         pageViewType: PageViewType.without_Nav_Bar,
//         isScrollable: true,
//         topSheetHeight: 400.h,
//         topSheetColor: fydPDgrey,
// //?-----------------------------------------------------------------------------
//         topSheet: Stack(
//           fit: StackFit.expand,
//           children: [
//             //! Image Carousel
//             (_uiController.product.productImages.isEmpty)
//                 ? Center(child: FydText.b1white(text: 'Image Not Available'))
//                 : ProductCarouselSlider(
//                     imageUrl: _uiController.product.productImages,
//                     imageCount: _uiController.product.productImages.length,
//                     onSwap: (int index) {
//                       _uiController.indicatorIndex.value = index;
//                     }),

//             //! dot indicator
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: GetX<ProductUiController>(builder: (uiController) {
//                 return DotsIndicator(
//                   dotsCount: (_uiController.product.productImages.length != 0)
//                       ? _uiController.product.productImages.length
//                       : 1,
//                   position: uiController.indicatorIndex.value.toDouble(),
//                   decorator: DotsDecorator(
//                     size: const Size.square(9.0),
//                     activeSize: const Size(18.0, 9.0),
//                     activeColor: fydSOrange,
//                     color: fydPDgrey,
//                     activeShape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5.0)),
//                   ),
//                 );
//               }),
//             ).paddingOnly(bottom: 20.h),

//             //! Back btn
//             Align(
//               alignment: Alignment.topLeft,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: Size.zero,
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.r)),
//                     primary: fydPDgrey),
//                 child: Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   size: 25.sp,
//                 ).paddingAll(6.sp),
//                 onPressed: () => Get.back(id: AppRoutes.StoresNavigatorKey),
//               ),
//             ).paddingOnly(left: 15.w, top: 15.w),
//           ],
//         ),
//         bottomSheet: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 15.h),
//             child: GetX<ProductUiController>(builder: (uiController) {
//               if (uiController.isFetching.isTrue ||
//                   uiController.productRealtime.value == null) {
//                 return const FydCircularIndicator();
//               } else {
//                 if (uiController.productRealtime.value!.inStock == false) {
//                   return Padding(
//                     padding: EdgeInsets.only(top: 80.h),
//                     child: Center(
//                         child: Image.asset('assets/logo/Mask group (2).png')),
//                   );
//                 } else {
//                   return Column(
//                     children: [
//                       //! Product Info Section
//                       ProductInfoSection(
//                               productName:
//                                   uiController.productRealtime.value!.name,
//                               company:
//                                   uiController.productRealtime.value!.company,
//                               price: uiController
//                                   .productRealtime.value!.sellingPrice
//                                   .toString())
//                           .paddingSymmetric(vertical: 15.h),
//                       const Divider(
//                         color: fydPWhite,
//                       ),
//                       //! Size section
//                       ProductSizeSection(
//                         sizeGuideOnPressed: () {},
//                         controller: uiController.sizeController,
//                         sizeList: uiController.availableSizeRealtime,
//                         hvPadding: EdgeInsets.symmetric(
//                             vertical: 15.h, horizontal: 12.w),
//                       ).paddingOnly(top: 5.h, bottom: 15.h),
//                       const Divider(
//                         color: fydPWhite,
//                       ),
//                       //! Description section { policy + desc }
//                       FydDropdownSection(
//                         heading: 'Description and Policy',
//                         description:
//                             uiController.productRealtime.value!.description,
//                       ),
//                       //! AddToCart btn
//                       FydBtn(
//                         height: 60.h,
//                         color: fydPGrey,
//                         fydText: FydText.h3white(text: 'Add to Cart'),
//                         onPressed: () {
//                           if (uiController.sizeController.selectedIndex ==
//                               null) {
//                             fydSnack(
//                                 message: 'Select size to add in Cart',
//                                 snackposition: SnackPosition.TOP);
//                           } else {
//                             // Todo: Add Product to Cart
//                           }
//                         },
//                       ).paddingOnly(top: 50.h),
//                     ],
//                   );
//                 }
//               }
//             }),
//           ),
//         ));
//   }
// }

// class ProductInfoSection extends StatelessWidget {
//   final String productName;
//   final String company;
//   final String price;
//   const ProductInfoSection({
//     Key? key,
//     required this.productName,
//     required this.company,
//     required this.price,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FydText.b1white(
//               text: productName,
//               weight: FontWeight.bold,
//             ),
//             FydText.b2grey(
//               text: company,
//               weight: FontWeight.w500,
//             )
//           ],
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [FydText.h2white(text: '\$ $price')],
//         ),
//       ],
//     );
//   }
// }

// class ProductSizeSection extends StatelessWidget {
//   const ProductSizeSection({
//     Key? key,
//     required this.sizeGuideOnPressed,
//     required this.controller,
//     required this.sizeList,
//     required this.hvPadding,
//   }) : super(key: key);

//   final VoidCallback sizeGuideOnPressed;
//   final GroupButtonController controller;
//   final List<String> sizeList;
//   final EdgeInsets hvPadding;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         //! size and sizeGuide btn
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             FydText.h2white(text: 'Size'),
//             InkWell(
//                 onTap: sizeGuideOnPressed,
//                 child: FydText.b3grey(text: 'Size Guide'))
//           ],
//         ),

//         //! Size selection list
//         ProductSizeGroupBtn(
//                 controller: controller,
//                 hvPadding: hvPadding,
//                 sizeList: sizeList)
//             .paddingOnly(
//           top: 15.h,
//         ),
//       ],
//     );
//   }
// }
