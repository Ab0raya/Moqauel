import 'package:flutter/material.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/account_details_view_body.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key, required this.totalIncome, required this.totalExpenses, required this.ownerName, required this.location});
  final int totalIncome;
  final int totalExpenses;
  final String ownerName;
  final String location;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AccountDetailsViewBody(totalIncome: totalIncome, totalExpenses: totalExpenses, ownerName: ownerName, location: location,),
    );
  }
}
