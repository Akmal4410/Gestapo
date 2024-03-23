import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String hintText;
  final IconData icon;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: maxLines,
      style: context.textTheme.labelMedium,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.tertiary,
        hintText: hintText,
        hintStyle: context.textTheme.labelMedium,
        prefixIcon: Icon(
          icon,
          color: context.colorScheme.primary,
        ),
        contentPadding: EdgeInsets.all(20.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
