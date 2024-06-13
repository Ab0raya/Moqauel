import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
   CustomMaterialButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.height,
    required this.width,
    required this.labelStyle,
    this.bgColor = DarkMode.kPrimaryColor,
    this.child ,
  });

  final String label;
  final Function() onTap;
  final double height;
  final double width;
  final TextStyle labelStyle;
  Color bgColor;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textColor: DarkMode.kBgColor,
      height: height,
      minWidth: width,
      child: child ?? Text(label, style: labelStyle),
    );
  }
}
