import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (getScreenHeight(context)*0.1).sh,
        SizedBox(
          height: getScreenHeight(context) * 0.4,
          child: PageView.builder(itemBuilder: (context,index){
            return Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(10),
             // color: Colors.red,
              child: SvgPicture.asset(
                'assets/images/onboarding_pics/Group88.svg',
                semanticsLabel: 'My SVG Image',
                height: 100,
                width: 70,
              ),

            );
          }),
        ),
        (getScreenHeight(context)*0.05).sh,
        Text(
          'Accounts',
          style: Styles.textStyle37.copyWith(
            color: DarkMode.kPrimaryColor,
          ),
        ),
        (getScreenHeight(context)*0.02).sh,
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: const BoxDecoration(
              color: DarkMode.kPrimaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16)
              )
            ),
            
          ),
        )
      ],
    );
  }
}
