import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';

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
              splashColor: DarkMode.kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
              onTap: (){
                context.go(AppRouter.personalAccountViewPath);
              },
              child: const ShadowContainer(
                child: CircleAvatar(
                  backgroundColor: DarkMode.kPrimaryColor,
                  radius: 30,
                  child: Icon(
                    CupertinoIcons.person,
                    color: DarkMode.kBgColor,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: getScreenWidth(context) * 0.03,
            ),
             Text('${S.of(context).hello} ', style: Styles.textStyle22),
            Text(
              S.of(context).userName,
              style:
                  Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
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


