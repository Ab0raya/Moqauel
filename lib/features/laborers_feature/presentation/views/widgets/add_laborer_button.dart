import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class AddLaborerButton extends StatelessWidget {
  const AddLaborerButton({
    super.key, required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: const Icon(
        CupertinoIcons.person_crop_circle_badge_plus,
        color: DarkMode.kPrimaryColor,
        size: 35,
      ),
      label: Text(
        S.of(context).addLaborer,
        style: Styles.textStyle24
            .copyWith(color: DarkMode.kPrimaryColor),
      ),
    );
  }
}

