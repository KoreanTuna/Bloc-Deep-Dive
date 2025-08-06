import 'package:door_stamp/core/theme/color_style.dart';
import 'package:door_stamp/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.isObscureText = false,
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
  });

  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final String? initialValue;
  final String? hintText;
  final bool isObscureText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController(
      text: initialValue,
    );
    final FocusNode focusNode = useFocusNode();

    return TextField(
      controller: controller,

      focusNode: focusNode,
      obscureText: isObscureText,
      keyboardType: keyboardType,
      enabled: !isDisabled,
      style: const TextStyle().body1.copyWith(
        color: isDisabled ? ColorStyle.coolGray300 : ColorStyle.gray850,
      ),

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle().body1.copyWith(
          color: ColorStyle.coolGray300,
        ),
        fillColor: isDisabled ? ColorStyle.gray400 : ColorStyle.white,
        focusColor: isDisabled ? ColorStyle.gray400 : ColorStyle.white,

        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.coolGray300),
        ),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.coolGray500),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.gray300),
        ),
      ),
      cursorColor: ColorStyle.primary500,

      onChanged: (value) {
        onChanged?.call(value);
      },
    );
  }
}
