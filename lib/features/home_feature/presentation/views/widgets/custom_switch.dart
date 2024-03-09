import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key, required this.isIncome, required this.change,
  });
  final bool isIncome;
  final void Function(bool) change;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'وارد',
            style: Styles.textStyle18,
          ),
          SizedBox(
            width: getScreenHeight(context) * 0.01,
          ),
          Switch(
            value: isIncome,
            onChanged: change,
            thumbColor: const MaterialStatePropertyAll(DarkMode.kPrimaryColor),
            trackColor: MaterialStatePropertyAll(DarkMode.kPrimaryColor.withOpacity(0.2)),
            trackOutlineColor: const MaterialStatePropertyAll(DarkMode.kPrimaryColor),
            activeTrackColor: Colors.grey,
            activeColor: DarkMode.kPrimaryColor,
            inactiveThumbColor: DarkMode.kPrimaryColor,
            thumbIcon: const MaterialStatePropertyAll(Icon(Icons.monetization_on)),
          ),
          SizedBox(
            width: getScreenHeight(context) * 0.01,
          ),
          const Text(
            'مدفوع',
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
