import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/features/home_feature/presentation/views/account_details_view/widgets/treatment_card.dart';

import '../../../../data/model/treatment_model.dart';

class DismissibleTreatmentCard extends StatelessWidget {
  final Map<String, dynamic> treatmentData;
  final VoidCallback onDismissed;

  const DismissibleTreatmentCard({
    Key? key,
    required this.treatmentData,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int treatmentId = treatmentData['treatmentId'];
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(treatmentId.toString()),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(
          CupertinoIcons.delete_solid,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDismissed();
        }
      },
      child: TreatmentCard(
        treatment: Treatment(
          title: treatmentData['title'],
          time: treatmentData['time'],
          details: treatmentData['details'],
          cost: treatmentData['cost'],
          isIncome: treatmentData['isIncome'] == 0,
        ),
      ),
    );
  }
}
