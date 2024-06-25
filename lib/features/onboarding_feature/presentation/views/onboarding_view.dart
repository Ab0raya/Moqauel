import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/controller/language_cubit/language_cubit.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/onboarding_feature/presentation/widgets/onboarding_view_body.dart';

import '../../../../core/utils/controller/language_cubit/language_state.dart';
import '../../../../generated/l10n.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<LanguageCubit>(context);
              return TextButton(
                onPressed: () {
                  cubit.languageToggle();
                },
                child: Text(
                  S
                      .of(context)
                      .specificLanguage,
                  style: Styles.textStyle24.copyWith(
                    color: DarkMode.kPrimaryColor(context),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const OnboardingViewBody(),
    );
  }
}
