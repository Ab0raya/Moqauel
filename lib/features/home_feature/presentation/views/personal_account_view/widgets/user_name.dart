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
    return FutureBuilder(
      future: context.read<UsernameCubit>().getUsername(),
      builder: (context, snapshot) {
        return Text(
          "${snapshot.data}",
          style: Styles.textStyle37,
        );
      },
    );
  }
}