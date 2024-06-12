import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';

import '../../../../../../core/utils/widgets/shadow_container.dart';

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
                  color: DarkMode.kBgColor,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              width: getScreenWidth(context) * 0.03,
            ),
            const Text('مرحبا, ', style: Styles.textStyle22),
            Text(
              'حاج سيد',
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


