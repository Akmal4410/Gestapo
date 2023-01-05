import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.onSaved,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onSaved: onSaved,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: kLightGrey,
        hintText: hintText,
        hintStyle: const TextStyle(color: kGrey),
        prefixIcon: Icon(
          icon,
          color: kGrey,
        ),
        contentPadding: const EdgeInsets.all(17),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhite, width: 1.5),
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
