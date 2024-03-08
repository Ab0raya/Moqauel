import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, required this.label, required this.onTap, required this.height, required this.width, required this.labelStyle,
  });
  final String label;
  final Function() onTap;
  final double height;
  final double width;
  final TextStyle labelStyle;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: DarkMode.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textColor: DarkMode.kBgColor,
      height: height,
      minWidth: width,
      child: Text(
        label,
        style: labelStyle
      ),
    );
  }
}
