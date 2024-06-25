import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';

class PropertyRow extends StatelessWidget {
  final String title;

  const PropertyRow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 13),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle22.copyWith(
              color: DarkMode.kPrimaryColor(context),
            ),
          ),
          40.sh,
        ],
      ),
    );
  }
}