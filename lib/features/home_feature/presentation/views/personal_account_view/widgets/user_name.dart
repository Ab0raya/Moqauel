import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoghl/core/utils/styles.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/controller/username_cubit/username_cubit.dart';
import '../../../../../../generated/l10n.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameCubit, UsernameState>(
      builder: (context, state) {
        if (state is UsernameLoading) {
          return const CircularProgressIndicator();
        } else if (state is UsernameLoadingFailed) {
          return Text("Error: ");
        } else if (state is UsernameEditedSuccessfully) {
          return FutureBuilder(
              future: context.read<UsernameCubit>().getUsername(),
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
                  style: Styles.textStyle37,
                );
              });
        } else {
          return FutureBuilder(
              future: context.read<UsernameCubit>().getUsername(),
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
                  style: Styles.textStyle37,
                );
              });
        }
      },
    );
  }
}
