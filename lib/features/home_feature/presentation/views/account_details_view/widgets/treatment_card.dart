import 'package:flutter/material.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../data/model/treatment_model.dart';

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
      height: getScreenHeight(context)*0.15,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.11),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            treatment.title,
            style: Styles.textStyle22
                .copyWith(color: DarkMode.kPrimaryColor),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

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
          10.sh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getScreenWidth(context)*0.6,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  treatment.details,
                  style: Styles.textStyle22
                      .copyWith(color: Colors.white.withOpacity(0.44)),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
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
