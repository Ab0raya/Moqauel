import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.validator, // Validator parameter added
    required this.controller, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: DarkMode.kPrimaryColor,
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: DarkMode.kPrimaryColor),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: DarkMode.kPrimaryColor),
          ),
          hintText: hint,
          hintStyle: Styles.subtitleTextStyle,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
