import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/views/account_details_view/widgets/accound_details_view_addons.dart';
import 'package:shoghl/features/home_feature/presentation/views/home_view/widgets/custom_appbar.dart';
import 'package:shoghl/features/home_feature/presentation/views/account_details_view/widgets/treatment_list.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';
import '../../home_view/widgets/delete_dialog.dart';

class AccountDetailsViewBody extends StatelessWidget {
  const AccountDetailsViewBody({
    Key? key,
    required this.accountData,
  }) : super(key: key);

  final Map<String, dynamic> accountData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TreatmentCubit, TreatmentState>(
      builder: (context, state) {
        final treatmentCubit = BlocProvider.of<TreatmentCubit>(context);
        if (state is TreatmentInitial) {
          treatmentCubit.fetchTotalIncomeAndExpenses(
              accId: accountData['accountId']);
        }

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (getScreenWidth(context) * 0.04).sh,
                    AccountDetailsAppBar(
                      deleteIcon: () {
                        buildDeleteDialog(context, () {
                          treatmentCubit.deleteAccountWithTreatments(
                              accountData['accountId'], context);
                        });
                      },
                      addIcon: () {
                        AccountDetailsViewAddons(accountData: accountData)
                            .buildShowModalBottomSheet(context);
                      },
                      printIcon: () {},
                    ),
                    (getScreenWidth(context) * 0.02).sh,
                    Text(
                      accountData['ownerName'],
                      style: Styles.textStyle24.copyWith(
                        color: DarkMode.kPrimaryColor,
                        fontSize: 30,
                      ),
                    ),
                    (getScreenWidth(context) * 0.006).sh,
                    Text(
                      accountData['locationName'],
                      style: Styles.textStyle24.copyWith(
                        color: DarkMode.kPrimaryColor.withOpacity(0.4),
                        fontSize: 22,
                      ),
                    ),
                    (getScreenWidth(context) * 0.04).sh,
                    if (state is TreatmentLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (state is TreatmentIncomeExpensesLoaded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AccountDetailsViewAddons(accountData: accountData)
                              .buildTotalBoard(
                            context: context,
                            title: 'إجمالي الوارد',
                            amount: state.totalIncome,
                          ),
                          AccountDetailsViewAddons(accountData: accountData)
                              .buildTotalBoard(
                            context: context,
                            title: 'إجمالي المدفوع',
                            amount: state.totalExpenses,
                          ),
                        ],
                      ),
                    (getScreenWidth(context) * 0.06).sh,
                  ],
                ),
              ),
            ),
            TreatmentsList(accountId: accountData['accountId']),
            SliverToBoxAdapter(
              child: 50.sh,
            ),
          ],
        );
      },
    );
  }
}
