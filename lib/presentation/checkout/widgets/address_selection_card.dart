import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

import '../../core/widgets/fyd_text_ellipsis.dart';

class AddressSelectionCard extends StatefulWidget {
  final List<String> address;
  const AddressSelectionCard({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<AddressSelectionCard> createState() => _AddressSelectionCardState();
}

class _AddressSelectionCardState extends State<AddressSelectionCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      // child: Card(
      //   color: fydPGrey,
      //   shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 FydText.b1grey(
      //                   text: widget.address.elementAt(0),
      //                   weight: FontWeight.w600,
      //                 ),
      //                 FydText.b1grey(
      //                   text: '+91  ${widget.address.elementAt(1)}',
      //                   weight: FontWeight.w600,
      //                 ),
      //               ],
      //             ),
      //             Radio(
      //               value: isSelected,
      //               groupValue: true,
      //               onChanged: (value) {
      //                 setState(() {
      //                   isSelected = !isSelected;
      //                 });
      //               },
      //               toggleable: true,
      //               fillColor:
      //                   MaterialStateColor.resolveWith((states) => fydSBlue),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 FydTextEllipsis(
      //                   width: 260.w,
      //                   fydText: FydText.b3white(
      //                     text: widget.address.elementAt(2),
      //                     weight: FontWeight.w600,
      //                   ),
      //                 ),
      //                 FydTextEllipsis(
      //                   width: 260.w,
      //                   fydText: FydText.b3white(
      //                     text:
      //                         '${widget.address.elementAt(3)}, ${widget.address.elementAt(4)}',
      //                     weight: FontWeight.w600,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             TextButton(
      //                 onPressed: () {},
      //                 style: TextButton.styleFrom(
      //                   minimumSize: Size.zero,
      //                   padding: EdgeInsets.zero,
      //                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //                 ),
      //                 child: FydText.b2grey(
      //                   text: 'Edit',
      //                   weight: FontWeight.bold,
      //                 ))
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
