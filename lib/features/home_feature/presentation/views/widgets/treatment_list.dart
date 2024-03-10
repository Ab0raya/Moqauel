import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_treatment_cubit/add_treatment_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/treatment_card.dart';
import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/model/treatment_model.dart';

class TreatmentsList extends StatelessWidget {
  const TreatmentsList({
    super.key,
    required this.accountId,
  });

  final int accountId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTreatmentCubit, AddTreatmentState>(
      builder: (context, state) {
        if (state is AddTreatmentSuccessfully) {
          return _buildTreatmentsList(context);
        } else {
          return _buildTreatmentsList(context);
        }
      },
    );
  }

  FutureBuilder<List<Map<String, dynamic>>> _buildTreatmentsList(
      BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: context.read<AddTreatmentCubit>().fetchAllData(accId: accountId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                ' : حدث خطأ${snapshot.error}',
                style: Styles.headingTextStyle.copyWith(color: Colors.red),
              ),
            ),
          );
        } else if ((snapshot.data![2]['treatmentData'] as List<dynamic>).isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'ليس هناك حسابات لعرضها',
                style: Styles.headingTextStyle
                    .copyWith(color: DarkMode.kPrimaryColor),
              ),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                int reversedIndex = (snapshot.data![2]['treatmentData'] as List<dynamic>).length - 1 - index;
                final Map<String, dynamic> treatmentData = snapshot.data![2]['treatmentData'][reversedIndex];
                return TreatmentCard(
                  treatment: Treatment(
                    title: treatmentData['title'],
                    time: treatmentData['time'],
                    details: treatmentData['details'],
                    cost: treatmentData['cost'],
                    isIncome: treatmentData['isIncome'] == 0,
                  ),
                );
              },
              childCount: (snapshot.data![2]['treatmentData'] as List<dynamic>).length,
            ),
          );
        }
      },
    );
  }
}

/*

 */
