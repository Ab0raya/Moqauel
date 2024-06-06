import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/model/treatment_model.dart';

class TreatmentCard extends StatelessWidget {
  final Treatment treatment;

  const TreatmentCard({
    super.key,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.11),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                treatment.title,
                style: Styles.textStyle22
                    .copyWith(color: DarkMode.kPrimaryColor),
              ),
              Text(
                treatment.time,
                style: Styles.textStyle22.copyWith(color: Colors.white),
              ),
              Text(
                '${treatment.cost}',
                style: Styles.textStyle22
                    .copyWith(color: DarkMode.kPrimaryColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                treatment.details,
                style: Styles.textStyle22
                    .copyWith(color: Colors.white.withOpacity(0.44)),
              ),
              Text(
                treatment.isIncome ? 'وارد' : 'مدفوع',
                style: Styles.textStyle22
                    .copyWith(color: DarkMode.kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
