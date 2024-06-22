import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';

import '../controller/onboarding_feature_cubit.dart';
import '../controller/onboarding_feature_state.dart';


class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<OnboardingCubit>(context);
          return Column(
            children: [
              (getScreenHeight(context) * 0.1).sh,
              SizedBox(
                height: getScreenHeight(context) * 0.5,
                child: PageView.builder(
                  controller: state.pageController,
                  onPageChanged: (index) {
                    cubit.changeIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/onboarding_pics/${index + 1}.svg',
                            semanticsLabel: 'My SVG Image',
                            height: 380,
                            width: 380,
                          ),
                          (getScreenHeight(context) * 0.05).sh,
                          Text(
                            '${cubit.onBoardingDate[index]['title']}',
                            style: Styles.textStyle37.copyWith(
                              color: DarkMode.kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: cubit.onBoardingDate.length,
                  reverse: true,

                ),
              ),
              (getScreenHeight(context) * 0.02).sh,
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: DarkMode.kPrimaryColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      (getScreenHeight(context) * 0.05).sh,
                      Text(
                        '${cubit.onBoardingDate[cubit.currentIndex]['Description']}',
                        style: Styles.textStyle27.copyWith(
                          color: DarkMode.kBgColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              int newPage = (cubit.currentIndex - 1) % cubit.onBoardingDate.length;
                              if (newPage < 0) newPage += cubit.onBoardingDate.length;
                              cubit.changeIndex(newPage);
                              //context.read<OnboardingCubit>().setPage(newPage);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 30,
                              color: DarkMode.kBgColor,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              state.onBoardingData.length,
                                  (index) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: (cubit.onBoardingDate.length - 1 - index) == cubit.currentIndex
                                      ? DarkMode.kBgColor
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: DarkMode.kBgColor,
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<OnboardingCubit>().setPage(
                                  (state.currentPage + 1) % state.onBoardingData.length);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: DarkMode.kBgColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
