import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_heading_with_back_btn.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
import 'package:verifyd_store/utils/router/routes.dart';

import '../../checkout/views/delivery/new_address_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydPageView(
        pageViewType: PageViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 350.h,
        topSheet: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! heading and back btn
            FydHeadingWithBackBtn(
              heading: 'Edit Info',
              onBackPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
            ),
            //! Edit-Info-Form
            EditInfoForm().paddingSymmetric(horizontal: 20.w)
          ],
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              //! Save btn
              FydBtn(
                color: fydPGrey,
                height: 60.h,
                fydText: FydText.h1white(text: 'Save'),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}

class EditInfoForm extends StatefulWidget {
  const EditInfoForm({Key? key}) : super(key: key);

  @override
  State<EditInfoForm> createState() => _EditInfoFormState();
}

class _EditInfoFormState extends State<EditInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FydTextFormField(
            controller: nameController,
            prefixText: 'Full name:  ',
            keyboardType: TextInputType.visiblePassword,
            onScrollPadding: false,
          ).paddingSymmetric(vertical: 10.h),
          FydTextFormField(
            controller: phoneController,
            prefixText: 'Phone +91:  ',
            keyboardType: TextInputType.phone,
            maxLength: 10,
            onScrollPadding: false,
          ).paddingSymmetric(vertical: 10.h),
          FydTextFormField(
            controller: emailController,
            prefixText: 'email:  ',
            keyboardType: TextInputType.visiblePassword,
            onScrollPadding: false,
          ).paddingOnly(top: 10.h, bottom: 20.h),
        ],
      ),
    );
  }
}
