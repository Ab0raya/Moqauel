import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/shadow_container.dart';

import 'custom_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const ShadowContainer(
              child: CircleAvatar(
                backgroundColor: DarkMode.kPrimaryColor,
                radius: 30,
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              width: getScreenWidth(context) * 0.03,
            ),
            const Text('مرحبا, ', style: Styles.titleTextStyle),
            Text(
              'حاج سيد',
              style:
                  Styles.titleTextStyle.copyWith(color: DarkMode.kPrimaryColor),
            ),
          ],
        ),
        SizedBox(
          width: getScreenWidth(context) * 0.35,
        ),
         ShadowContainer(
           child: CustomContainer(
            height: 60,
            width: 60,
            onTap: () {
            },
            child: const Icon(
              CupertinoIcons.list_bullet,
              color: DarkMode.kPrimaryColor,
              size: 30,
            ),
                   ),
         ),
      ],
    );
  }
}