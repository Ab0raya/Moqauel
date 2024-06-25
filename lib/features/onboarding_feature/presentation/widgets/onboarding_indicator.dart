import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingIndicator({
    Key? key,
    required this.currentIndex,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: getScreenWidth(context) * 0.1,
          height: 9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (itemCount - 1 - index) == currentIndex
                ? DarkMode.kBgColor
                : DarkMode.kBgColor.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
