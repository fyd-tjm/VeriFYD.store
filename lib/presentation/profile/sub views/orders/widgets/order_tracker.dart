import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';

class OrderTracker extends StatelessWidget {
  OrderTracker({Key? key, required this.activate}) : super(key: key);
  final int activate;
  List<String> step = const [
    'Placed',
    'Confirmed',
    'Shipped',
    'Delivered',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stepper(
          isActive: true,
          title: step[0],
        ),
        Stepper(
          isActive: (activate > 0),
          title: step[1],
        ),
        Stepper(
          isActive: (activate > 1),
          title: step[2],
        ),
        Stepper(
          isActive: (activate > 2),
          title: step[3],
          isLastStepper: true,
        ),
      ],
    );
  }
}

class Stepper extends StatelessWidget {
  const Stepper({
    Key? key,
    this.isActive = false,
    required this.title,
    this.isLastStepper = false,
  }) : super(key: key);
  final bool isActive;
  final String title;
  final bool isLastStepper;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: (!isActive) ? Colors.grey[350] : fydLogoBlue,
                borderRadius: BorderRadius.circular(100),
                //more than 50% of width makes circle
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Order",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: (!isActive) ? Colors.grey[350] : fydLogoBlue,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: (!isActive) ? Colors.grey[350] : fydLogoBlue,
              ),
            ),
          ],
        ),
        (isLastStepper)
            ? SizedBox.shrink()
            : SizedBox(
                width: 30.w,
                child: Divider(
                  color: (!isActive) ? Colors.grey[350] : fydLogoBlue,
                  thickness: 2,
                  height: 20,
                ),
              ),
      ],
    );
  }
}
