import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/home_feature/presentation/views/account_details_view/widgets/treatment_card.dart';
import '../../../../data/model/treatment_model.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';

class DismissibleTreatmentCard extends StatelessWidget {
  final Map<String, dynamic> treatmentData;

  const DismissibleTreatmentCard({
    Key? key,
    required this.treatmentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(treatmentData['treatmentId'].toString()),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          CupertinoIcons.delete_solid,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          BlocProvider.of<TreatmentCubit>(context).deleteTreatment(treatmentData['treatmentId'], accId: treatmentData['accountId']);
        }
      },
      child: TreatmentCard(
        treatment: Treatment(
          title: treatmentData['title'],
          time: treatmentData['time'],
          details: treatmentData['details'],
          cost: treatmentData['cost'],
          isIncome: treatmentData['isIncome'] == 1,
        ),
      ),
    );
  }
}
