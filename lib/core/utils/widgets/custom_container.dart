import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';


class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child, required this.onTap, this.onLongTap});

  final double height;
  final double width;
  final Widget child;
  final void Function() onTap;
  final void Function()? onLongTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onLongPress: onLongTap,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: DarkMode.kWhiteColor.withOpacity(0.4), width: 2),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                DarkMode.kWhiteColor.withOpacity(0.1),
                DarkMode.kBgColor,
              ],
              stops: const [0.5, 0.0],
            ),
            color: Colors.red,
        ),
        child: child,
      ),
    );
  }
}
