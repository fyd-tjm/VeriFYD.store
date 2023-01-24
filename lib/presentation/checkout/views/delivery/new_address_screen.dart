// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/aa%20mock/static_ui.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

// import '../../../../utils/router/routes.dart';

// //!  Widgets => { AddressForm, DropdownMenu, FydTextFormField }

// class NewAddressScreen extends StatelessWidget {
//   NewAddressScreen({Key? key}) : super(key: key);
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: FydPageView(
//           pageViewType: PageViewType.without_Nav_Bar,
//           isScrollable: true,
//           topSheetHeight: 80.h,
//           topSheet: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   //! DeliveryInfo Heading
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           FydText.d2black(text: '   New Address'),
//                         ]),
//                   ),
//                   //! back btn
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           minimumSize: Size.zero,
//                           padding: EdgeInsets.zero,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.r)),
//                           primary: fydPDgrey),
//                       child: Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         size: 25.sp,
//                       ).paddingAll(6.sp),
//                       onPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
//                     ),
//                   ).paddingOnly(left: 15.w),
//                 ],
//               ).paddingOnly(top: 10.h),
//             ],
//           ),
//           bottomSheet: const SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             primary: true,
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Padding(
//               padding: EdgeInsets.all(15.0),
//               child: AddressForm(),
//             ),
//           )),
//     );
//   }
// }

// class AddressForm extends StatefulWidget {
//   const AddressForm({Key? key}) : super(key: key);

//   @override
//   State<AddressForm> createState() => _AddressFormState();
// }

// class _AddressFormState extends State<AddressForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController al1Controller = TextEditingController();
//   final TextEditingController al2Controller = TextEditingController();
//   final TextEditingController pincodeController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   String? _state = MockUi.states.elementAt(0);
//   // String? _state;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             Column(
//               children: [
//                 FydTextFormField(
//                   controller: nameController,
//                   prefixText: 'Full name:  ',
//                   keyboardType: TextInputType.visiblePassword,
//                 ).paddingSymmetric(vertical: 15.h),
//                 FydTextFormField(
//                   controller: phoneController,
//                   prefixText: 'Phone +91:  ',
//                   keyboardType: TextInputType.phone,
//                   maxLength: 10,
//                 ).paddingSymmetric(vertical: 15.h),
//                 FydTextFormField(
//                   controller: emailController,
//                   prefixText: 'email:  ',
//                   keyboardType: TextInputType.visiblePassword,
//                 ).paddingSymmetric(vertical: 15.h),
//                 FydTextFormField(
//                   controller: al1Controller,
//                   prefixText: null,
//                   hintText: ' Address Line 1:',
//                   keyboardType: TextInputType.visiblePassword,
//                 ).paddingSymmetric(vertical: 15.h),
//                 FydTextFormField(
//                   controller: al2Controller,
//                   prefixText: null,
//                   hintText: ' Address Line 2: (optional)',
//                   keyboardType: TextInputType.visiblePassword,
//                 ).paddingSymmetric(vertical: 15.h),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * .4,
//                         child: FydTextFormField(
//                           controller: pincodeController,
//                           prefixText: null,
//                           hintText: ' Pincode:',
//                           keyboardType: TextInputType.number,
//                         )),
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * 1 / 2,
//                         child: FydTextFormField(
//                           controller: cityController,
//                           prefixText: null,
//                           hintText: ' City:',
//                           keyboardType: TextInputType.visiblePassword,
//                         ))
//                   ],
//                 ).paddingSymmetric(vertical: 10.h),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: DropdownMenu(
//                       list: MockUi.states,
//                       onSelect: (value) {
//                         log(value);
//                       }),
//                 ).paddingSymmetric(vertical: 10.h)
//               ],
//             ),
//             FydBtn(
//                     color: fydPLgrey,
//                     height: 60.h,
//                     fydText: FydText.h2white(text: 'Save'),
//                     onPressed: () {})
//                 .paddingOnly(top: 30.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DropdownMenu extends StatefulWidget {
//   final List<String> list;
//   final Function(String) onSelect;
//   const DropdownMenu({Key? key, required this.list, required this.onSelect})
//       : super(key: key);

//   @override
//   State<DropdownMenu> createState() => _DropdownMenuState();
// }

// class _DropdownMenuState extends State<DropdownMenu> {
//   @override
//   Widget build(BuildContext context) {
//     String _value = widget.list.elementAt(0);
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(15.r),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.black, width: 2),
//           borderRadius: BorderRadius.circular(15.r),
//         ),
//         filled: true,
//         fillColor: fydSBlue,
//       ),
//       style: const TextStyle(
//         color: fydPDgrey,
//         fontWeight: FontWeight.w600,
//         letterSpacing: 1,
//         fontSize: 26,
//         decoration: TextDecoration.none,
//       ),
//       dropdownColor: fydSBlue,
//       value: _value,
//       items: widget.list.map<DropdownMenuItem<String>>(
//         (String val) {
//           return DropdownMenuItem<String>(
//             value: val,
//             child: Text(val),
//           );
//         },
//       ).toList(),
//       onChanged: (val) {
//         setState(() {
//           _value = val.toString();
//           widget.onSelect(val.toString());
//         });
//       },
//     );
//   }
// }

// class FydTextFormField extends StatelessWidget {
//   const FydTextFormField({
//     Key? key,
//     required this.controller,
//     this.keyboardType = TextInputType.name,
//     this.autoFocus = false,
//     this.textCapitalization = TextCapitalization.none,
//     this.hintText,
//     required this.prefixText,
//     this.hintStyle = const TextStyle(fontSize: 22, color: fydPLgrey),
//     this.prefixStyle = const TextStyle(fontSize: 22, color: fydPLgrey),
//     this.inputStyle = const TextStyle(
//       color: fydTWhite,
//       fontWeight: FontWeight.w600,
//       letterSpacing: 1,
//       fontSize: 26,
//       decoration: TextDecoration.none,
//     ),
//     this.textAlign = TextAlign.start,
//     this.vPadding = 15,
//     this.hPadding = 10,
//     this.maxLength,
//     this.fillColor = fydPGrey,
//     this.onSaved,
//     this.validator,
//     this.onScrollPadding = true,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final bool autoFocus;
//   final TextCapitalization textCapitalization;
//   final String? hintText;
//   final String? prefixText;
//   final TextStyle hintStyle;
//   final TextStyle prefixStyle;
//   final TextStyle inputStyle;
//   final TextAlign textAlign;
//   final double vPadding;
//   final double hPadding;
//   final int? maxLength;
//   final Color fillColor;
//   final Function(String?)? onSaved;
//   final bool onScrollPadding;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onSaved: onSaved,
//       validator: validator,
//       keyboardType: keyboardType,
//       autofocus: autoFocus,
//       textCapitalization: textCapitalization,
//       controller: controller,
//       // text Styling
//       style: inputStyle,
//       textAlign: textAlign,
//       showCursor: true,
//       maxLength: maxLength,
//       textInputAction: TextInputAction.next,
//       cursorColor: fydSBlue,
//       cursorWidth: 4,
//       cursorHeight: 30,
//       // scrolling
//       scrollPadding: (onScrollPadding)
//           ? EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom + 60.h)
//           : const EdgeInsets.all(0),
//       // textfield styling
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: hintStyle,
//         // prefixText: prefixText, prefixStyle: prefixStyle,
//         isDense: true,
//         prefixIcon: (prefixText != null)
//             ? Text("   $prefixText  ", style: prefixStyle)
//             : null,
//         prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
//         contentPadding:
//             EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
//         // to hide max length counter
//         counterText: '',
//         fillColor: fillColor,
//         filled: true,

//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15.r),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
