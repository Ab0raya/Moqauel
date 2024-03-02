import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, required this.label, required this.onTap,
  });
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: DarkMode.kPrimaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.white.withOpacity(0.2), width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textColor: DarkMode.kBgColor,
      child: Text(
        label,
        style: Styles.headingTextStyle
            .copyWith(color: DarkMode.kBgColor),
      ),
    );
  }
}
