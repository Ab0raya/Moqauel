import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/core/utils/widgets/custom_material_button.dart';
import 'package:shoghl/core/utils/widgets/text_form_field.dart';
import 'package:shoghl/features/onboarding_feature/presentation/widgets/onboardingContent.dart';
import 'package:shoghl/features/onboarding_feature/presentation/widgets/pick_avatar_widget.dart';

import '../../../../core/utils/controller/username_cubit/username_cubit.dart';
import '../../../../generated/l10n.dart';
import '../controller/onboarding_cubit/onboarding_cubit.dart';
import '../controller/onboarding_cubit/onboarding_state.dart';
import 'onboarding_indicator.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextEditingController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<OnboardingCubit>(context);
        return Column(
          children: [
            (getScreenHeight(context) * 0.1).sh,
            SizedBox(
              height: getScreenHeight(context) * 0.5,
              child: PageView.builder(
                onPageChanged: (index) {
                  cubit.changeIndex(index);
                },
                itemBuilder: (context, index) {
                  if (index > 3) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatars/${cubit.avatarIndex}.png',
                            width: 200,
                            height: 200,
                          ),
                          CustomTextFormField(
                            hint: S.of(context).userName,
                            icon: CupertinoIcons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).noName;
                              }
                              return null;
                            },
                            controller: nameTextEditingController,
                          ),
                          40.sh,
                          BlocBuilder<UsernameCubit, UsernameState>(
                            builder: (context, state) {
                              final usernameCubit = BlocProvider.of<UsernameCubit>(context);
                              return CustomMaterialButton(
                                label: S.of(context).done,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    usernameCubit.addUsername(username: nameTextEditingController.text,avatar: cubit.avatarIndex);
                                    usernameCubit.addInitialViewValueInserted(isOpened: true);
                                    context.go(AppRouter.homeViewPath);
                                  }
                                },
                                height: 50,
                                width: 100,
                                labelStyle: Styles.textStyle24,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return OnboardingContent(
                      imagePath:
                          'assets/images/onboarding_pics/${index + 1}.svg',
                      title: cubit.getOnboardingData(context: context)[index]
                          ['title'],
                    );
                  }
                },
                itemCount: cubit.getOnboardingData(context: context).length + 1,
                reverse: true,
              ),
            ),
            (getScreenHeight(context) * 0.02).sh,
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.all(10),
                decoration:   BoxDecoration(
                  color: DarkMode.kPrimaryColor(context),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    cubit.currentIndex < 4
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: getScreenHeight(context) * 0.08),
                            child: Text(
                              '${cubit.getOnboardingData(context: context)[cubit.currentIndex]['Description']}',
                              style: Styles.textStyle27.copyWith(
                                color: DarkMode.kBgColor(context),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const PickAvatarWidget(),
                    const Spacer(),
                    OnboardingIndicator(
                      currentIndex: cubit.currentIndex,
                      itemCount:
                          cubit.getOnboardingData(context: context).length + 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
