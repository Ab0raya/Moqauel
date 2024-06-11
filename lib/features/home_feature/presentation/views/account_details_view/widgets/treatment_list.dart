import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';
import 'dismissible_treatment_card.dart';

class TreatmentsList extends StatelessWidget {
  const TreatmentsList({
    super.key,
    required this.accountId,
  });

  final int accountId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreatmentCubit, TreatmentState>(
      builder: (context, state) {
        if (state is TreatmentSuccessfully ||
            state is TreatmentDeletedSuccessfully) {
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
      future: context.read<TreatmentCubit>().fetchAllData(accId: accountId),
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
                style: Styles.textStyle24.copyWith(color: Colors.red),
              ),
            ),
          );
        } else if ((snapshot.data![2]['treatmentData'] as List<dynamic>)
            .isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'ليس هناك معاملات لعرضها',
                style:
                    Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
              ),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                int reversedIndex =
                    (snapshot.data![2]['treatmentData'] as List<dynamic>)
                            .length -
                        1 -
                        index;
                int treatmentId = (snapshot.data!)[2]['treatmentData']
                    [reversedIndex]['treatmentId'];
                final Map<String, dynamic> treatmentData =
                    snapshot.data![2]['treatmentData'][reversedIndex];
                return DismissibleTreatmentCard(
                  treatmentData: treatmentData,
                  onDismissed: () {
                    context.read<TreatmentCubit>().deleteTreatment(treatmentId);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                            'تم حذف المعاملة',
                            style: Styles.textStyle20
                                .copyWith(color: DarkMode.kPrimaryColor),
                          ),
                          backgroundColor: DarkMode.kBgColor),
                    );
                  },
                );
              },
              childCount:
                  (snapshot.data![2]['treatmentData'] as List<dynamic>).length,
            ),
          );
        }
      },
    );
  }
}


