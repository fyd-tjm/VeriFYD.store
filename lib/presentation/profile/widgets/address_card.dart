import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

import '../../core/widgets/fyd_text_ellipsis.dart';

class AddressCard extends StatelessWidget {
  final List<String> address;
  const AddressCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Card(
        color: fydPGrey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FydText.b1grey(
                        text: address.elementAt(0),
                        weight: FontWeight.w600,
                      ),
                      FydText.b1grey(
                        text: '+91  ${address.elementAt(1)}',
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.only(right: 10.w, bottom: 15.w),
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: fydPLgrey,
                      size: 30.sp,
                    ),
                    splashRadius: 20.r,
                    splashColor: fydPGrey,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text: address.elementAt(2),
                          weight: FontWeight.w600,
                        ),
                      ),
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text:
                              '${address.elementAt(3)}, ${address.elementAt(4)}',
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: FydText.b2grey(
                        text: 'Edit',
                        weight: FontWeight.bold,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
