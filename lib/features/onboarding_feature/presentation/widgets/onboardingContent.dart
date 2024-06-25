import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final String title;

  const OnboardingContent({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          SvgPicture.asset(
            imagePath,
            semanticsLabel: 'Onboarding Image',
            height: 380,
            width: 380,
          ),
          (getScreenHeight(context) * 0.05).sh,
          Text(
            title,
            style: Styles.textStyle37.copyWith(
              color: DarkMode.kPrimaryColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
