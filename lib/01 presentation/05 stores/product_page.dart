import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_info_view_page.dart';
import 'package:verifyd_store/02%20application/product/product_bloc.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import 'widgets/export_widgets.dart';

//?-----------------------------------------------------------------------------

class ProductWrapperPage extends StatelessWidget {
  const ProductWrapperPage({Key? key, required this.productRef})
      : super(key: key);

  final String productRef;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductBloc>()..add(GetProductRealtime(productRef: productRef)),
      child: const ProductPage(),
    );
  }
}

//?-----------------------------------------------------------------------------

class ProductPage extends HookWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageIndex = useState(0);
    final selectedSize = useState('');

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<ProductBloc, ProductState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/product') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            //! Failure
            if (state.failure.isSome()) {
              state.failure.fold(
                  () => null,
                  (productFailure) => showSnack(
                        context: context,
                        message: productFailure.when(
                          permissionDenied: () => 'permission-denied',
                          notFound: () => 'product not found',
                          serverError: () => 'server error, try later!',
                          unexpectedError: () => 'unexpected error, try later!',
                        ),
                      ));
            }
            //! Failure(Or)Success-AddingToCart
            if (state.cartFailureOrSuccess.isSome()) {
              state.cartFailureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => showSnack(
                    context: context,
                    durationSeconds: 1,
                    textSize: 18,
                    message: failureOrSuccess.fold(
                      (failure) => failure.whenOrNull(
                        maxItemAvailability: () => 'No more left in stock',
                        maxCartLimit: () => 'Max cart limit reached.',
                        unexpectedError: (e) => 'unexpected Error, try later!',
                      ),
                      (success) => 'item Added to cart!',
                    )),
              );
            }
            //! Cart-Permission-state
            if (state.newCartPermissionState == true) {
              showPermissionDialog(
                context: context,
                title: 'Alert!',
                message:
                    'Items of other Store exists in cart. Should we proceed by removing those ',
              ).then((permission) {
                if (permission == true) {
                  context
                      .read<ProductBloc>()
                      .add(AddNewCartWithProduct(size: selectedSize.value));
                }
              });
            }
          },
          builder: (context, state) {
            //! fetching
            if (state.isFetching && state.productRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydBblue,
                  size: 40.0,
                ),
              );
            }
            //! null
            else if (state.productRealtime == null) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.network(
                    'https://imgtr.ee/images/2023/02/18/OHk7I.png',
                    fit: BoxFit.fitWidth,
                    width: 250,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 100),
                    child: FydBtn(
                      color: fydSblack,
                      onPressed: () => context.router.pop(),
                      height: 50,
                      fydText: const FydText.b1custom(
                        text: 'Go Back',
                        color: fydBbluegrey,
                      ),
                    ),
                  )
                ],
              );
            }
            //! product-Page
            else {
              final inStock = (state.productRealtime!.inStock ||
                  !state.productRealtime!.sizeAvailability.values
                      .every((value) => value == 0));
              return FydView(
                pageViewType: ViewType.without_Nav_Bar,
                isScrollable: false,
                topSheetHeight: 350.h,
                topSheetColor: fydSblack,
                topSheet: _topSheetView(context, state, imageIndex, inStock),
                bottomSheet:
                    _bottomSheetView(context, state, selectedSize, inStock),
              );
            }
          },
        ),
      ),
    );
  }

//?--Top-Sheet-View-------------------------------------------------------------
  _topSheetView(
    BuildContext context,
    ProductState state,
    ValueNotifier<int> imageIndex,
    bool inStock,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //! image-carousel
        (state.productRealtime!.productImages.isEmpty)
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hide_image_outlined,
                    size: 150.h,
                    color: fydPgrey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: const FydText.b2custom(
                      text: 'Image Not Available',
                      color: fydPgrey,
                      letterSpacing: .9,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : ProductCarouselSlider(
                imageUrls: (inStock)
                    ? state.productRealtime!.productImages
                    : [state.productRealtime!.thumbnailImage],
                imageCount:
                    (inStock) ? state.productRealtime!.productImages.length : 1,
                onSwap: (int idx) {
                  imageIndex.value = idx;
                },
              ),
        //! dot Indicators
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount:
                    (inStock) ? state.productRealtime!.productImages.length : 1,
                position: imageIndex.value.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: fydBbluegrey,
                  color: fydPblack,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )),
        ),
        //! back Btn
        Align(
          alignment: Alignment.topCenter,
          child: FydAppBar(
            leading: AppBarBtn(
                iconData: FontAwesomeIcons.arrowLeftLong,
                iconSize: 20,
                padding: const EdgeInsets.all(10.0),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  context.router.pop();
                }),
            main: const SizedBox(),
          ),
        ),
      ],
    );
  }

//?--Bottom-Sheet-View----------------------------------------------------------
  _bottomSheetView(
    BuildContext context,
    ProductState state,
    ValueNotifier<String> selectedSize,
    bool inStock,
  ) {
    //! sold out
    if (inStock == false) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! sold-out Image
          Image.asset(
            'assets/logo/soldout.png',
            fit: BoxFit.contain,
            height: 300.h,
          ),
          //! go-back btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FydBtn(
              onPressed: () {
                HapticFeedback.lightImpact();
                context.router.pop();
              },
              color: fydSblack,
              fydText: const FydText.h3custom(
                text: 'Go back ←',
                color: fydBblue,
                weight: FontWeight.w600,
              ),
            ),
          )
        ],
      );
    }
    //! product-details
    else {
      // filter map for stockout sizes
      final sizeMap = Map.of(state.productRealtime!.sizeAvailability)
        ..removeWhere((key, value) => value == 0);
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 15.h),
                child: Column(
                  children: [
                    const FydDivider(color: fydBbluegrey),
                    //! product-Info section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 15.h,
                      ),
                      child: ProductInfoSection(
                        productName: state.productRealtime!.name,
                        company: state.productRealtime!.company,
                        price: state.productRealtime!.sellingPrice.toString(),
                      ),
                    ),
                    const FydDivider(color: fydBbluegrey),
                    //! Product-Size section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 15.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //! top-section
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //! heading
                                const FydText.b2custom(
                                  text: 'Size',
                                  color: fydPwhite,
                                  letterSpacing: .9,
                                ),
                                //! size-guide btn
                                InkWell(
                                  onTap: () {},
                                  child: const FydText.b3custom(
                                    text: 'Size Guide',
                                    color: fydPgrey,
                                    weight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          //! Size-selection-List
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              spacing: 20.w,
                              runSpacing: 10.h,
                              children: List.generate(
                                sizeMap.entries.length,
                                (idx) => ProductSizeTile(
                                  size: sizeMap.keys.elementAt(idx),
                                  tileColor: (selectedSize.value ==
                                          sizeMap.keys.elementAt(idx))
                                      ? fydBblue.withOpacity(.8)
                                      : fydSblack,
                                  onPressed: (size) =>
                                      selectedSize.value = size,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FydDivider(color: fydBbluegrey),
                    //! Description and policy
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 15.h,
                      ),
                      child: StoreInfoExpansionTile(
                        title: 'Description & Policy',
                        titleSize: 18,
                        color: fydPwhite,
                        widgets: [
                          //! sku+storeId
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: 10.h,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //! storeId
                                FydRichText(
                                  size: 14,
                                  color: fydPgrey,
                                  weight: FontWeight.w600,
                                  textList: [
                                    const TextSpan(text: 'storeId : '),
                                    TextSpan(
                                        text: state.productRealtime!.storeId,
                                        style: const TextStyle(
                                            color: fydBbluegrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                                //! skuId
                                FydRichText(
                                  size: 14,
                                  color: fydPgrey,
                                  weight: FontWeight.w600,
                                  textList: [
                                    const TextSpan(text: 'skuId : '),
                                    TextSpan(
                                        text: state.productRealtime!.skuId,
                                        style: const TextStyle(
                                            color: fydBbluegrey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //! description
                          FydTextCard(
                            backgroundColor: Colors.transparent,
                            message: state.productRealtime!.description,
                            textColor: fydBbluegrey,
                            textSize: 15,
                            weight: FontWeight.w500,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.w),
                          ),
                          //! policy
                          FydTextCard(
                            backgroundColor: Colors.transparent,
                            message: state.productRealtime!.policy,
                            textColor: fydPgrey,
                            textSize: 14,
                            weight: FontWeight.w500,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 25.w),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //! AddToCart-BTN
          Padding(
            padding: EdgeInsets.only(
                bottom: 25.h, top: 10.h, left: 10.w, right: 10.w),
            child: FydBtn(
              height: 60.h,
              color: fydSblack,
              widget: (state.addingToCart == true)
                  ? const SpinKitWave(color: fydBblue, size: 20.0)
                  : const FydText.h3custom(
                      text: 'Add to Cart  ➢',
                      color: fydBblue,
                      weight: FontWeight.w600,
                    ),
              onPressed: () async {
                if (state.addingToCart == true) {
                  return;
                } else if (selectedSize.value.isEmpty) {
                  return showSnack(
                      viewType: SnackBarViewType.withoutNav,
                      durationSeconds: 3,
                      context: context,
                      message: 'select  SIZE  before adding to Cart',
                      textSize: 18);
                } else {
                  context
                      .read<ProductBloc>()
                      .add(AddToCart(size: selectedSize.value));
                }
              },
            ),
          ),
        ],
      );
    }
  }
}

//?-----------------------------------------------------------------------------
//! product-info-section
class ProductInfoSection extends StatelessWidget {
  final String productName;
  final String company;
  final String price;
  const ProductInfoSection({
    Key? key,
    required this.productName,
    required this.company,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //! product-company names
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FydEllipsisText(
              width: MediaQuery.of(context).size.width * (2 / 3),
              fydText: FydText.b2custom(
                text: productName,
                color: fydPwhite,
                weight: FontWeight.w700,
              ),
            ),
            FydText.b4custom(
              text: company,
              weight: FontWeight.bold,
              color: fydPgrey,
              letterSpacing: .9,
            )
          ],
        ),
        //! price
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FydText.b1custom(
              text: '₹ $price',
              color: fydBblue,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}

//?-----------------------------------------------------------------------------
//! Product-Size-Tile
class ProductSizeTile extends StatelessWidget {
  const ProductSizeTile({
    Key? key,
    required this.size,
    required this.tileColor,
    required this.onPressed,
  }) : super(key: key);
  final String size;
  final Color tileColor;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 70.w,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onPressed(size);
        },
        child: Card(
          color: tileColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(child: FydText.b1custom(text: size, color: fydPwhite)),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
