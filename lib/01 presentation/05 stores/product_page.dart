import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/stores/product/product_bloc.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import 'widgets/export_widgets.dart';

class ProductWrapperPage extends StatelessWidget {
  const ProductWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()
        ..add(
          const GetProductRealtime(productRef: 'stores/#W12R/products/#A112'),
        ),
      child: ProductPage(
        product: MockUi.product,
      ),
    );
  }
}

class ProductPage extends HookWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final imageIndex = useState(0);
    final selectedSize = useState('');

    return Scaffold(
      backgroundColor: fydPDgrey,
      body: SafeArea(
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state.failure.isSome()) {
              context.read<ProductBloc>().add(const ToggleStates());
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
                ),
              );
            } else if (state.newCartPermissionState == true) {
              //? dialog and add newCartEvent
              //------
              context.read<ProductBloc>().add(const ToggleStates());
              showPermissionDialog(
                      context: context,
                      // title: 'title',
                      message:
                          'Items of other Store exists in cart. \n Should we proceed by removing those ')
                  .then((permission) {
                if (permission == true) {
                  context
                      .read<ProductBloc>()
                      .add(AddNewCartWithProduct(size: selectedSize.value));
                }
              });
            } else if (state.cartFailureOrSuccess.isSome()) {
              context.read<ProductBloc>().add(const ToggleStates());
              //Todo: error naming Refactor
              state.cartFailureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                  (addCartFailure) => addCartFailure.when(
                    notAvailableAnymore: () => null,
                    maxItemAvailability: () => showSnack(
                        context: context, message: 'max Item Availability'),
                    maxCartLimit: () =>
                        showSnack(context: context, message: 'max Cart limit'),
                    notFound: () => null,
                    permissionDenied: () => null,
                    serverError: () =>
                        showSnack(context: context, message: 'server Error'),
                    unexpectedError: () => showSnack(
                        context: context,
                        message: 'unexpected Error, try again!'),
                  ),
                  (addCartSuccess) => showSnack(
                      context: context, message: 'item Added to cart'),
                ),
              );
            }
          },
          child: FydView(
            pageViewType: ViewType.without_Nav_Bar,
            isScrollable: false,
            topSheetHeight: 350.h,
            topSheetColor: fydPDgrey,
            topSheet: _topSheetView(context, imageIndex),
            bottomSheet: _bottomSheetView(context, selectedSize),
          ),
        ),
      ),
    );
  }

//?--Top-Sheet-View-------------------------------------------------------------
  _topSheetView(BuildContext context, ValueNotifier<int> imageIndex) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // image-carousel
        (product.productImages.isEmpty)
            ? Placeholder(
                child: Center(
                  child: FydText.b1white(text: 'Image Not Available'),
                ),
              )
            : ProductCarouselSlider(
                imageUrl: product.productImages,
                imageCount: product.productImages.length,
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
                dotsCount: MockUi.productImages.length,
                position: imageIndex.value.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: fydSOrange,
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
              //TODO: back navigation
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

//?--Bottom-Sheet-View----------------------------------------------------------
  _bottomSheetView(BuildContext context, ValueNotifier<String> selectedSize) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.isFetching || state.productRealtime == null) {
          //? loading
          return const Center(
            child: SpinKitWave(
              color: fydPWhite,
              size: 40.0,
            ),
          );
        } else if (state.productRealtime!.inStock == false) {
          // Todo : outofStock image
          return Center(
            child: FydText.h1custom(
              text: 'Out of Stock',
              weight: FontWeight.w700,
              color: fydDustyPeach,
            ),
          );
        } else {
          // filter map for stockout sizes
          final sizeMap = Map.of(state.productRealtime!.sizeAvailability)
            ..removeWhere((key, value) => value == 0);
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //? Product-Detail-Section
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  // reverse: true,

                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    child: Column(
                      children: [
                        const Divider(
                          color: fydPLgrey,
                          thickness: 1.2,
                          height: 30,
                        ),
                        ProductInfoSection(
                          productName: state.productRealtime!.name,
                          company: state.productRealtime!.company,
                          price: state.productRealtime!.sellingPrice.toString(),
                        ),
                        const Divider(
                          color: fydPLgrey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FydText.h2white(text: 'Size'),
                                  InkWell(
                                      onTap: () {},
                                      child: FydText.b3grey(text: 'Size Guide'))
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
                                        ? fydSOrange
                                        : fydPGrey,
                                    onPressed: (size) =>
                                        selectedSize.value = size,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: fydPLgrey,
                          thickness: 1.2,
                          height: 30,
                        ),
                        ProductExpansionTile(
                          description: state.productRealtime!.description,
                          policy: state.productRealtime!.description,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //? AddToCart-BTN
              Padding(
                padding: EdgeInsets.only(
                    bottom: 25.h, top: 15.h, left: 15.w, right: 15.w),
                child: FydBtn(
                  height: 60.h,
                  color: fydPGrey,
                  widget: (state.addingToCart == true)
                      ? const SpinKitWave(color: fydPWhite, size: 20.0)
                      : FydText.h1custom(
                          text: 'Add to Cart',
                          color: fydSOrange,
                        ),
                  onPressed: () {
                    if (selectedSize.value.isEmpty) {
                      return showSnack(
                          backgroundColor: fydDustyPeach,
                          durationSeconds: 2,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height - 140.h),
                          backgroundOpacity: 1,
                          context: context,
                          // message: 'select Size before adding to Cart',
                          fydText: FydText.h1black(
                              weight: FontWeight.bold,
                              text: 'select Size before adding to Cart'));
                    }
                    if (state.addingToCart == true) return;
                    context
                        .read<ProductBloc>()
                        .add(AddToCart(size: selectedSize.value));
                  },
                ),
              ),
            ],
          );
        }
      },
    );
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
            FydText.b2grey(
              text: company,
              weight: FontWeight.w500,
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FydText.h2custom(
              text: '₹ $price',
              color: fydSOrange,
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
                  FydText.b2grey(
                    text: description,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Policy
                  FydText.b2grey(
                    text: policy,
                    weight: FontWeight.w600,
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

