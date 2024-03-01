import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
class ShadowContainer extends StatelessWidget {
  const ShadowContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0,20),
              color: DarkMode.kPrimaryColor.withOpacity(0.1),
            ),
          ],
      ),
      child: child,
    );
  }
}
