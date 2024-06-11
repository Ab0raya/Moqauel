import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';
import '../../home_view/widgets/bottom_sheet_body.dart';



class AccountDetailsViewAddons{
  final Map<String, dynamic> accountData;

  AccountDetailsViewAddons({required this.accountData});
  FutureBuilder<List<Map<String, dynamic>>> buildFutureTotalIncome(
      BuildContext context, TreatmentState state) {
    return FutureBuilder(
      future: context
          .read<TreatmentCubit>()
          .fetchAllData(accId: accountData['accountId']),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is TreatmentSuccessfully) {
            return buildTotalBoard(
              context: context,
              title: 'إجمالي الوارد',
              amount: snapshot.data![0]['totalIncome'] ?? 0,
            );
          } else {
            return buildTotalBoard(
              context: context,
              title: 'إجمالي الوارد',
              amount: snapshot.data![1]['totalExpenses'] ?? 0,
            );
          }
        }
      },
    );
  }

  FutureBuilder<int> buildFutureTotalExpenses(
      BuildContext context, TreatmentState state) {
    return FutureBuilder(
        future: context
            .read<TreatmentCubit>()
            .fetchTotalExpenses(accId: accountData['accountId']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (snapshot.hasData) {
            if (state is TreatmentSuccessfully) {
              return buildTotalBoard(
                context: context,
                title: 'إجمالي المدفوع',
                amount: snapshot.data ?? 0,
              );
            } else {
              return buildTotalBoard(
                context: context,
                title: 'إجمالي المدفوع',
                amount: snapshot.data ?? 0,
              );
            }
          }
          return Container();
        });
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetBody(
          accId: accountData['accountId'],
        );
      },
    );
  }

  Widget buildTotalBoard({
    required BuildContext context,
    required String title,
    required int amount,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: getScreenHeight(context) * 0.006,
        ),
        Text(
          '$amount',
          style: Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
        ),
      ],
    );
  }
}