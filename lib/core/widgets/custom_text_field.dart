import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLiens,
    this.onChanged,
    this.onSaved,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.controller,
  });

  final String hint;
  final int? maxLiens;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator ??
          (data) {
            if (data!.isEmpty) {
              return 'data is required';
            }
            return null;
          },
      maxLines: maxLiens ?? 1,
      cursorColor: AppColor.kButtonColor,
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintStyle: TextStyles.font14deepGreenMedium,
        border: buildOutlineInputBorder(AppColor.kButtonColor),
        enabledBorder: buildOutlineInputBorder(AppColor.kButtonColor),
        focusedBorder: buildOutlineInputBorder(AppColor.kButtonColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 1.2,
        color: color ?? Colors.white,
      ),
    );
  }
}
