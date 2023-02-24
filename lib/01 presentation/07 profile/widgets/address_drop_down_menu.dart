//! drpdown-selection
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class AddressDropdownMenu extends HookWidget {
  final List<String> list;
  final String? startValue;
  final Function(String) onSelect;
  final String? Function(String?)? validator;
  const AddressDropdownMenu({
    Key? key,
    required this.list,
    this.startValue,
    required this.onSelect,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = useState<String?>(startValue);

    return DropdownButtonFormField(
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydPLgrey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydPLgrey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydNotifRed, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydNotifRed, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      hint: const FydText.h2custom(
        text: 'select state:',
        color: fydTGrey,
      ),
      style: const TextStyle(
        color: fydPWhite,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontSize: 22,
        decoration: TextDecoration.none,
      ),
      dropdownColor: fydPGrey,
      value: value.value,
      items: list.map<DropdownMenuItem<String>>(
        (String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        value.value = val.toString();
        onSelect(val.toString());
      },
    );
  }
}
