import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/views/account_details_view/widgets/accound_details_view_addons.dart';
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
      key: Key(treatmentData['treatmentId'].toString()),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.delete_solid,
              color: Colors.white,
            ),
            20.sw,
            const Text(
              'حذف المعاملة',
              style: Styles.textStyle24,
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: DarkMode.kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'عرض البايانات',
              style: Styles.textStyle24.copyWith(color: DarkMode.kBgColor),
            ),
            20.sw,
            const Icon(
              CupertinoIcons.eye_solid,
              color: DarkMode.kBgColor,
            )
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if(direction == DismissDirection.endToStart){
          AccountDetailsViewAddons(accountData: {})
              .buildTreatmentDialog(
            context: context,
            treatmentData:  Treatment(
              title: treatmentData['title'],
              time: treatmentData['time'],
              details: treatmentData['details'],
              cost: treatmentData['cost'],
              isIncome: treatmentData['isIncome'] == 1,
            ),
          );
          return false;
        }else{
          return true;
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          BlocProvider.of<TreatmentCubit>(context).deleteTreatment(
              treatmentData['treatmentId'],
              accId: treatmentData['accountId']);
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
