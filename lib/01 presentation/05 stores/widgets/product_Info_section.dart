import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

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
