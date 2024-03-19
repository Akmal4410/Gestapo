import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);
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
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kLightGrey,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.kGreyLight),
        prefixIcon: Icon(
          icon,
          color: AppColors.kGreyLight,
        ),
        contentPadding: const EdgeInsets.all(17),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kWhite, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
