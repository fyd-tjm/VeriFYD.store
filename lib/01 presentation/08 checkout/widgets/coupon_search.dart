import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/widgets/coupon_card.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';

class CouponSearch extends SearchDelegate<Coupon?> {
  final BuildContext context;
  final double orderSubTotal;
  final Map<String, Coupon> searchableCoupons;
  final Map<String, Coupon> availableCoupons;
  final void Function(MapEntry<String, String>) onTap;
  CouponSearch({
    required this.orderSubTotal,
    required this.context,
    required this.searchableCoupons,
    required this.availableCoupons,
    required this.onTap,
  }) : super(searchFieldLabel: null, textInputAction: TextInputAction.search);
  Coupon? searchResult;

  @override
  TextInputType get keyboardType => TextInputType.visiblePassword;

  @override
  void showResults(BuildContext context) {
    searchResult = null;
    if (searchableCoupons.containsKey(query.toUpperCase())) {
      searchResult = (searchableCoupons[query.toUpperCase()]!);
    }
    super.showResults(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      (query.isEmpty)
          ? Container()
          : TextButton(
              onPressed: () => showResults(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    FydText.b3custom(text: 'Find', color: fydBblue),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 3),
                      child: Icon(
                        Icons.find_replace,
                        color: fydBblue,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        size: 25,
        color: fydBbluegrey,
      ),
      splashColor: fydSblack,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      onPressed: () {
        FocusScope.of(context).unfocus();
        HapticFeedback.heavyImpact();
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final couponList =
        query.isEmpty ? (availableCoupons.values).toList() : <Coupon>[];
    return ListView.builder(
      itemBuilder: (context, index) {
        final isEnabled = (couponList.elementAt(index).onOrderValue == null)
            ? true
            : orderSubTotal >= couponList.elementAt(index).onOrderValue!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: CouponCard(
            coupon: couponList.elementAt(index),
            isEnabled: isEnabled,
            onApply: (coupon) {
              HapticFeedback.lightImpact();
              FocusScope.of(context).unfocus();
              close(context, coupon);
            },
          ),
        );
      },
      itemCount: couponList.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final isEnabled = (searchResult?.onOrderValue == null)
            ? true
            : orderSubTotal >= searchResult!.onOrderValue!;
        return (searchResult == null)
            ? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Center(
                        child: FydText.b2custom(
                            text: 'No Coupon Found!', color: fydBbluegrey)),
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: CouponCard(
                  coupon: searchResult!,
                  isEnabled: isEnabled,
                  onApply: (coupon) {
                    HapticFeedback.lightImpact();
                    FocusScope.of(context).unfocus();
                    close(context, coupon);
                  },
                ),
              );
      },
      itemCount: 1,
    );
  }
}
