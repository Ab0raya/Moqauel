import 'package:flutter/material.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/custom_appbar.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/treatment_list.dart';
import 'bottom_sheet_body.dart';

class AccountDetailsViewBody extends StatelessWidget {
  const AccountDetailsViewBody({
    Key? key,
    required this.accountData,
  }) : super(key: key);

  final Map<String, dynamic> accountData;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: getScreenHeight(context) * 0.02),
                AccountDetailsAppBar(
                  addIcon: () {
                    buildShowModalBottomSheet(context);
                  },
                  printIcon: () {},
                ),
                SizedBox(height: getScreenHeight(context) * 0.02),
                Text(
                  accountData['ownerName'],
                  style: Styles.headingTextStyle.copyWith(
                    color: DarkMode.kPrimaryColor,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.006,
                ),
                Text(
                  //accountData['accountId']
                  accountData['locationName'],
                  style: Styles.headingTextStyle.copyWith(
                    color: DarkMode.kPrimaryColor.withOpacity(0.4),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTotalBoard(
                      context: context,
                      title: 'إجمالي المدفوع',
                      amount: 0,
                    ),
                    buildTotalBoard(
                      context: context,
                      title: 'إجمالي الوارد',
                      amount: 0,
                    ),
                  ],
                ),
                SizedBox(height: getScreenHeight(context) * 0.06),
              ],
            ),
          ),
        ),
        TreatmentsList(accountId: accountData['accountId'],),
      ],
    );
  }


  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetBody(accId: accountData['accountId'],);
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
          style: Styles.titleTextStyle.copyWith(color: DarkMode.kPrimaryColor),
        ),
      ],
    );
  }
}



