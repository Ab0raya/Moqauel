import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final int? maxLines;
  final FocusNode? focusNode;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.validator,
    required this.controller, this.onChanged, this.textInputType, this.maxLines,this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: DarkMode.kPrimaryColor(context),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:   BorderSide(color: DarkMode.kPrimaryColor(context)),
          ),
          enabledBorder:  UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:   BorderSide(color: DarkMode.kPrimaryColor(context)),
          ),
          hintText: hint,
          hintStyle: Styles.textStyleNormal18,
        ),
        validator: validator,
        onChanged: onChanged,

      ),
    );
  }
}
