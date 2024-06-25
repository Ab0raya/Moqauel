import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/features/onboarding_feature/presentation/controller/onboarding_cubit/onboarding_cubit.dart';

import '../controller/onboarding_cubit/onboarding_state.dart';

class PickAvatarWidget extends StatelessWidget {
  const PickAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<OnboardingCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarButton(
                  imagePath: 'assets/images/avatars/1.png',
                  index: 2,
                  onTap: () {
                    cubit.changeAvatarINde(1);
                  },
                ),
                AvatarButton(
                  imagePath: 'assets/images/avatars/2.png',
                  index: 2,
                  onTap: () {
                    cubit.changeAvatarINde(2);

                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarButton(
                  imagePath: 'assets/images/avatars/3.png',
                  index: 2,
                  onTap: () {
                    cubit.changeAvatarINde(3);
                  },
                ),
                AvatarButton(
                  imagePath: 'assets/images/avatars/4.png',
                  index: 2,
                  onTap: () {
                    cubit.changeAvatarINde(4);
                    print('object');
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class AvatarButton extends StatelessWidget {
  const AvatarButton({
    super.key,
    required this.imagePath,
    required this.index,
    required this.onTap,
  });

  final String imagePath;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: DarkMode.kBgColor,
            width: 2,
          ),
        ),
        child: Image.asset(
          imagePath, width: 120, height: 120, fit: BoxFit.cover,),
      ),
    );
  }
}
