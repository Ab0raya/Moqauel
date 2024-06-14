import 'package:flutter/material.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/widgets/glass_container.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class ArchiveItemDialog extends StatelessWidget {
  const ArchiveItemDialog({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return  GlassContainer(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Text(
        title,
        style:
        Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
          ),
          30.sh,
          Text(
        value,
        style:
        Styles.textStyle37,
          ),
        ],
      ),
    );
  }
}
