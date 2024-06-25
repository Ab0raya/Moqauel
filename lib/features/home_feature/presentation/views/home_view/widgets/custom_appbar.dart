import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';

import '../../../../../../core/utils/controller/username_cubit/username_cubit.dart';
import '../../../../../../core/utils/widgets/shadow_container.dart';
import '../../../../../../generated/l10n.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            InkWell(
              splashColor: DarkMode.kPrimaryColor(context),
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                context.go(AppRouter.personalAccountViewPath);
              },
              child: ShadowContainer(
                child: CircleAvatar(
                  backgroundColor: DarkMode.kPrimaryColor(context),
                  radius: 30,
                  child: FutureBuilder(
                    future: context.read<UsernameCubit>().getAvatar(),
                    builder: (context, snapshot) {

                      return snapshot.data == null ? const CircularProgressIndicator():Image.asset('assets/images/avatars/${snapshot.data}.png');
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getScreenWidth(context) * 0.03,
            ),
            Text('${S.of(context).hello} ', style: Styles.textStyle22),
            FutureBuilder(
              future: context.read<UsernameCubit>().getUsername(),
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
                  style: Styles.textStyle22
                      .copyWith(color: DarkMode.kPrimaryColor(context)),
                );
              },
            ),
          ],
        ),
        SizedBox(
          width: getScreenWidth(context) * 0.3,
        ),
      ],
    );
  }
}
