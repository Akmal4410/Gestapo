import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        contentPadding: const EdgeInsets.all(20),
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
            )),
      ),
    );
  }
}
