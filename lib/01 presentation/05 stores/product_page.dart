import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_info_view_page.dart';
import 'package:verifyd_store/02%20application/product/product_bloc.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
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

    return Scaffold(
      backgroundColor: fydPDgrey,
      body: SafeArea(
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            // Failure-Product
            if (state.failure.isSome()) {
              state.failure.fold(
                  () => null,
                  (productFailure) => showSnack(
                        context: context,
                        message: productFailure.when(
                          permissionDenied: () => 'permission-denied',
                          notFound: () => 'product not found',
                          serverError: () => 'server error, try again',
                          unexpectedError: () => 'unexpected error, try again',
                        ),
                      ));
            }
            // Failure(Or)Success-AddingToCart
            if (state.cartFailureOrSuccess.isSome()) {
              state.cartFailureOrSuccess.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                        (addCartFailure) => addCartFailure.whenOrNull(
                          maxItemAvailability: () => showSnack(
                              context: context,
                              message: 'max Item Availability'),
                          maxCartLimit: () => showSnack(
                              context: context, message: 'max Cart limit'),
                          unexpectedError: (e) => showSnack(
                              context: context,
                              message: 'unexpected Error, try again!'),
                        ),
                        (addCartSuccess) => showSnack(
                            context: context, message: 'item Added to cart'),
                      ));
            }
            // Cart-Permission-state
            if (state.newCartPermissionState == true) {
              //? dialog and add newCartEvent
              showPermissionDialog(
                context: context,
                // title: 'title',
                message:
                    'Items of other Store exists in cart. \n Should we proceed by removing those ',
              ).then((permission) {
                if (permission == true) {
                  context
                      .read<ProductBloc>()
                      .add(AddNewCartWithProduct(size: selectedSize.value));
                }
              });
            }
          },
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            if (state.isFetching && state.productRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydBlueGrey,
                  size: 40.0,
                ),
              );
            } else if (state.productRealtime == null) {
              return Center(
                child: FydText.h1custom(
                  text: 'product not available at the moment',
                  weight: FontWeight.w700,
                  color: fydBlueGrey,
                ),
              );
            }
            //! product-Page
            else {
              return FydView(
                pageViewType: ViewType.without_Nav_Bar,
                isScrollable: false,
                topSheetHeight: 350.h,
                topSheetColor: fydPDgrey,
                topSheet: _topSheetView(context, state, imageIndex),
                bottomSheet: _bottomSheetView(context, state, selectedSize),
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
  ) {
    final inStock = state.productRealtime!.inStock;
    return Stack(
      fit: StackFit.expand,
      children: [
        // image-carousel
        (state.productRealtime!.productImages.isEmpty)
            ? Placeholder(
                child: Center(
                  child: FydText.b1white(text: 'Image Not Available'),
                ),
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
        // dot Indicators
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
                  activeColor: fydBlueGrey,
                  color: fydPDgrey,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )),
        ),

        // close Btn
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 15.w),
          child: Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  primary: fydPDgrey),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Icon(
                  Icons.close_rounded,
                  size: 30.w,
                  color: fydDustyPeach,
                ),
              ),
              //! back to previous route navigation
              onPressed: () {
                context.router.navigateBack();
              },
            ),
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
  ) {
    //! product-loading
    if (state.isFetching && state.productRealtime == null) {
      return Center(
        child: SpinKitWave(
          color: fydBlueGrey,
          size: 30.w,
        ),
      );
    }
    //! product-Error
    else if (state.isFetching == false && state.productRealtime == null) {
      return Center(
        child: FydText.b1custom(
          text: 'something went wrong!',
          color: fydBlueGrey,
          weight: FontWeight.bold,
        ),
      );
    }
    //! product-stockout
    else if (state.productRealtime!.inStock == false) {
      return Center(
        child: FydText.b1custom(
          text: 'Stock out!',
          color: fydBlueGrey,
          weight: FontWeight.bold,
        ),
      );
    }
    //! product-Info-view
    else {
      // filter map for stockout sizes
      final sizeMap = Map.of(state.productRealtime!.sizeAvailability)
        ..removeWhere((key, value) => value == 0);
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //! Product-Detail-Section
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  children: [
                    const Divider(
                      color: fydBlueGrey,
                      thickness: 1.2,
                      height: 30,
                    ),
                    ProductInfoSection(
                      productName: state.productRealtime!.name,
                      company: state.productRealtime!.company,
                      price: state.productRealtime!.sellingPrice.toString(),
                    ),
                    const Divider(
                      color: fydBlueGrey,
                      thickness: 1.2,
                      height: 30,
                    ),
                    //? ProductSizeSection
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //? size and sizeGuide btn
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FydText.h2white(text: 'Size'),
                              InkWell(
                                  onTap: () {},
                                  child: const FydText.b3custom(
                                    text: 'Size Guide',
                                    color: fydTGrey,
                                  ))
                            ],
                          ),
                        ),
                        //? Size-selection-List
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
                                    ? fydLogoBlue
                                    : fydPGrey,
                                onPressed: (size) => selectedSize.value = size,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: fydBlueGrey,
                      thickness: 1.2,
                      height: 30,
                    ),
                    StoreInfoExpansionTile(
                      title: 'Description & Policy',
                      color: fydBlueGrey,
                      widgets: [
                        FydTextCard(
                          backgroundColor: Colors.transparent,
                          message: (state.productRealtime!.description.isEmpty)
                              ? 'Description is Empty at the moment. show the policy in this scenario.'
                              : state.productRealtime!.description,
                          textColor: fydGreyWhite,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.w),
                        ),
                        FydTextCard(
                          backgroundColor: Colors.transparent,
                          message: (state.productRealtime!.description.isEmpty)
                              ? 'Description is Empty at the moment. show the policy in this scenario.'
                              : state.productRealtime!.description,
                          textColor: fydGreyWhite,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.w),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //! AddToCart-BTN
          Padding(
            padding: EdgeInsets.only(
                bottom: 25.h, top: 15.h, left: 15.w, right: 15.w),
            child: FydBtn(
              height: 60.h,
              color: fydPGrey,
              widget: (state.addingToCart == true)
                  ? const SpinKitWave(color: fydLogoBlue, size: 20.0)
                  : FydText.h1custom(
                      text: 'Add to Cart',
                      color: fydLogoBlue,
                    ),
              onPressed: () {
                if (state.addingToCart == true) {
                  return;
                } else if (selectedSize.value.isEmpty) {
                  return showSnack(
                      durationSeconds: 2,
                      context: context,
                      fydText: FydText.h1black(
                          weight: FontWeight.bold,
                          text: 'select Size before adding to Cart'));
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
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FydTextEllipsis(
              width: MediaQuery.of(context).size.width * (2 / 3),
              fydText: FydText.b1white(
                text: productName,
                weight: FontWeight.bold,
              ),
            ),
            FydText.b2custom(
              text: company,
              weight: FontWeight.w500,
              color: fydTGrey,
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FydText.h3custom(
              text: '₹ $price',
              color: fydLogoBlue,
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
          child: Center(child: FydText.h2custom(text: size, color: fydPWhite)),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
//! product-expansion-tile
class ProductExpansionTile extends StatelessWidget {
  const ProductExpansionTile({
    Key? key,
    required this.description,
    required this.policy,
  }) : super(key: key);
  final String description;
  final String policy;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: fydPGrey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
        child: ExpansionTile(
          iconColor: fydSOrange,
          collapsedIconColor: fydDustyPeach,
          title: FydText.h3custom(
            color: fydDustyPeach,
            text: 'Description and Policy',
            weight: FontWeight.w600,
          ),
          onExpansionChanged: (bool value) {},
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Description
                  FydText.b2custom(
                    text: description,
                    weight: FontWeight.w600,
                    color: fydTGrey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Policy
                  FydText.b2custom(
                    text: policy,
                    weight: FontWeight.w600,
                    color: fydTGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//?-----------------------------------------------------------------------------

