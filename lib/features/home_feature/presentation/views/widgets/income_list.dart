import 'package:flutter/material.dart';

import 'income_or_expense_card.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const IncomeOrExpenseCard(
            ownerName: 'أحمد رمزي',
            amount: 400,
            isIncome: true,
          );
        },
        childCount: 4, // Replace this with the actual count of items
      ),
    );
  }
}
