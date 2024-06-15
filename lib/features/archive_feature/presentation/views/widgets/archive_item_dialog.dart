import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/widgets/glass_container.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class ArchiveItemDialog extends StatelessWidget {
   ArchiveItemDialog({super.key, required this.title, required this.value, this.image});
  final String title;
  final String value;
  File? image;

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
          ClipRect(
            child: OverflowBox(
              alignment: Alignment.center,
              child: Image.file(
                image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
