//! drpdown-selection
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

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
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydSblack, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydPgrey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydAred, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: fydAred, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuMaxHeight: MediaQuery.of(context).size.height / 2,
      hint: const FydText.h2custom(
        text: 'select state:',
        color: fydPgrey,
      ),
      style: const TextStyle(
        color: fydPwhite,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontSize: 22,
        decoration: TextDecoration.none,
      ),
      dropdownColor: fydSblack,
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
