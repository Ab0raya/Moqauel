import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../core/utils/styles.dart';
class AddAccountItem extends StatelessWidget {
  const AddAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.person_crop_circle_badge_plus,
            color: DarkMode.kPrimaryColor,
            size: 30,
          ),
          label: Text(
            'أضف حساب',
            style: Styles.textStyle18
                .copyWith(color: DarkMode.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
