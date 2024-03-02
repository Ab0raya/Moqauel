import 'package:flutter/material.dart';

import 'account_card.dart';
class AccountList extends StatelessWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return const AccountCard(
            ownerName: 'م.أحمد رمزي',
            location: 'ق 219 التجمع الخامس',
            lastEdit: '22/12/2020',
            income: 15,
            expense: 3,
          );
        },
        childCount: 4, // Replace this with the actual count of items
      ),
    );
  }
}
