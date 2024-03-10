import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_treatment_cubit/add_treatment_cubit.dart';

import 'account_card.dart';
import '../../../presentation/controller/add_account_cubit/add_account_cubit.dart';

class AccountList extends StatelessWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAccountCubit, AddAccountState>(
      builder: (context, state) {
        if (state is AddAccountSuccessfully) {
          return _buildAccountList(context);
        } else {
          return _buildAccountList(context);
        }
      },
    );
  }

  Widget _buildAccountList(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: context.read<AddAccountCubit>().fetchData(),
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
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
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
                  (BuildContext context, int index) {
                int reversedIndex = snapshot.data!.length - 1 - index;
                final Map<String, dynamic> accountData = snapshot.data![reversedIndex];
                return BlocBuilder<AddTreatmentCubit, AddTreatmentState>(
                  builder: (context, state) {
                    return FutureBuilder(
                      future: context
                          .read<AddTreatmentCubit>()
                          .fetchAllData(accId: accountData['accountId']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: Text(''));
                        } else if (snapshot.hasError) {
                          return const Center(child: Text('Error occurred'));
                        } else if (snapshot.hasData) {
                          final treatmentCubit = BlocProvider.of<AddTreatmentCubit>(context);
                          return AccountCard(
                            ownerName: accountData['ownerName'] ?? '',
                            location: accountData['locationName'] ?? '',
                            lastEdit: accountData['lastEdit'] ?? '',
                            income: snapshot.data![0]['totalIncome'] ?? accountData['totalIncome'] ?? 0,
                            expense: snapshot.data![1]['totalExpenses'] ?? accountData['totalExpenses'] ?? 0,
                            onTap: () {
                              context.go(AppRouter.accountDetailsViewPath, extra: accountData);
                            },
                          );
                        } else {
                          return const Center(child: Text('No data available'));
                        }
                      },
                    );
                  },
                );
              },
              childCount: snapshot.data!.length,
            ),
          );

        }
      },
    );
  }
}
