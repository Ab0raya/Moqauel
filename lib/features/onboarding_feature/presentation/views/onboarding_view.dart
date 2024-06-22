import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/onboarding_feature/presentation/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'English',
              style: Styles.textStyle24.copyWith(
                color: DarkMode.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: const OnboardingViewBody(),
    );
  }
}
