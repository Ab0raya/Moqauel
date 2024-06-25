import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import '../../../generated/l10n.dart';

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
           Text(
             S.of(context).income,
            style: Styles.textStyle18,
          ),
          SizedBox(
            width: getScreenHeight(context) * 0.01,
          ),
          Switch(
            value: isIncome,
            onChanged: change,
            thumbColor:  WidgetStatePropertyAll(DarkMode.kPrimaryColor(context)),
            trackColor: WidgetStatePropertyAll(DarkMode.kPrimaryColor(context).withOpacity(0.2)),
            trackOutlineColor:  WidgetStatePropertyAll(DarkMode.kPrimaryColor(context)),
            activeTrackColor: Colors.grey,
            activeColor: DarkMode.kPrimaryColor(context),
            inactiveThumbColor: DarkMode.kPrimaryColor(context),
            thumbIcon:  WidgetStatePropertyAll(Icon(Icons.monetization_on,color: DarkMode.kBgColor(context),)),
          ),
          SizedBox(
            width: getScreenHeight(context) * 0.01,
          ),
           Text(
            S.of(context).expense,
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
