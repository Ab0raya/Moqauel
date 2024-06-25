import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({
    super.key,  this.borderRadius,  required this.onTap, required this.text, required this.currentIndex, required this.itemIndex,
  });
  final BorderRadiusGeometry? borderRadius;
  final void Function() onTap;
  final String text;
  final int currentIndex;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: DarkMode.kPrimaryColor(context),
              width: 1.5),
          borderRadius: borderRadius,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            color: currentIndex == itemIndex ? DarkMode.kPrimaryColor(context) : DarkMode.kBgColor(context),
            borderRadius: borderRadius,
          ),
          child: TextButton(
            onPressed: onTap,
            child: Text(text,
              style: Styles.textStyle18.copyWith(
                  color: currentIndex == itemIndex ? DarkMode.kBgColor(context) : DarkMode.kPrimaryColor(context)),),
          ),
        ),
      ),
    );
  }
}
