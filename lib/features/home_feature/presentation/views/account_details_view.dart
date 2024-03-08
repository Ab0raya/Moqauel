import 'package:flutter/material.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/account_details_view_body.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView(
      {super.key, required this.accountData,});


  final  Map<String, dynamic> accountData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountDetailsViewBody(
        accountData: accountData,
      ),
    );
  }
}
