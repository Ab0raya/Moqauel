import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';
import 'income_or_expense_card.dart';



class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreatmentCubit, TreatmentState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TreatmentCubit>(context);
        return FutureBuilder(
          future: cubit.fetchTreatmentsExpenses(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Error'),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }  else if (!snapshot.hasData || (snapshot.data! as List<dynamic>).isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    S.of(context).noExpenses,
                    style: Styles.textStyle24
                        .copyWith(color: DarkMode.kPrimaryColor),
                  ),
                ),
              );
            }else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    int reversedIndex = (snapshot.data! as List<dynamic>).length - 1 - index;
                    if((snapshot.data as List<dynamic>)[reversedIndex]['cost'] > 0 ){
                      return IncomeOrExpenseCard(
                        date: (snapshot.data as List<dynamic>)[reversedIndex]['time'],
                        title: (snapshot.data as List<dynamic>)[reversedIndex]['title'],
                        ownerName:
                        "${(snapshot.data as List<dynamic>)[reversedIndex]['accountName']}",
                        amount: (snapshot.data as List<dynamic>)[reversedIndex]['cost'],
                        isIncome: false,
                      );
                    }else{
                      return null;
                    }

                  },
                  childCount: (snapshot.data as List<dynamic>)
                      .length, // Replace this with the actual count of items
                ),
              );
            }
          },
        );
      },
    );
  }
}
