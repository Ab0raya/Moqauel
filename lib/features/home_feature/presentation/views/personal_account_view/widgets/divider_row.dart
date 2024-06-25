import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: getScreenWidth(context) * 0.3,
          height: 2,
          decoration: BoxDecoration(
            color: DarkMode.kPrimaryColor(context).withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'TheAburaya@',
            style: Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor(context)),
          ),
        ),
        Container(
          width: getScreenWidth(context) * 0.3,
          height: 2,
          decoration: BoxDecoration(
            color: DarkMode.kPrimaryColor(context).withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}