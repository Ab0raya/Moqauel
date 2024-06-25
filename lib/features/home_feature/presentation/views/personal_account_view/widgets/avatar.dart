import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/features/onboarding_feature/presentation/controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:shoghl/features/onboarding_feature/presentation/controller/onboarding_cubit/onboarding_state.dart';

import '../../../../../../core/utils/controller/username_cubit/username_cubit.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameCubit, UsernameState>(
      builder: (context, state) {
        if (state is AvatarLoading) {
          return const CircularProgressIndicator();
        } else if (state is AvatarLoadingFailed) {
          return const Text("Error: ");
        } else if (state is UserAvatarEditedSuccessfully) {
          return CircleAvatar(
            backgroundColor: DarkMode.kPrimaryColor(context),
            radius: 60,
            child: FutureBuilder(
              future: context.read<UsernameCubit>().getAvatar(),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? const CircularProgressIndicator()
                    : Image.asset(
                  'assets/images/avatars/${snapshot.data}.png',
                );
              },
            ),
          );
        } else {
          return CircleAvatar(
            backgroundColor: DarkMode.kPrimaryColor(context),
            radius: 60,
            child: FutureBuilder(
              future: context.read<UsernameCubit>().getAvatar(),
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? const CircularProgressIndicator()
                    : Image.asset(
                  'assets/images/avatars/${snapshot.data}.png',
                );
              },
            ),
          );
        }
      },
    );
  }
}


/*

 */