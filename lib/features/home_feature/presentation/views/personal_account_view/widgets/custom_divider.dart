import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      color: DarkMode.kPrimaryColor(context).withOpacity(0.6),
      endIndent: 20,
      indent: 20,
    );
  }
}
