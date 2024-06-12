import 'package:flutter/cupertino.dart';
import 'package:shoghl/constants/media_query.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_container.dart';
import '../../../../../../constants/colors.dart';

class IncomeOrExpenseCard extends StatelessWidget {
  const IncomeOrExpenseCard(
      {super.key,
      required this.ownerName,
      required this.amount,
      required this.isIncome,
      required this.date, required this.title});

  final String ownerName;
  final int amount;
  final bool isIncome;
  final String date;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: CustomContainer(
        height: 130,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              ownerName,
              style: Styles.textStyle22
                  .copyWith(fontSize: 30, color: DarkMode.kPrimaryColor),
            ),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getScreenWidth(context)*0.2,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: Styles.textStyle22.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: Styles.textStyle22
                      .copyWith(color: DarkMode.kPrimaryColor),
                ),
                Row(
                  children: [
                    Text(
                      '$amount',
                      style: Styles.textStyle24
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    isIncome
                        ? const Icon(
                            CupertinoIcons.arrow_down_left,
                            size: 40,
                            color: DarkMode.kPrimaryColor,
                          )
                        : const Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 40,
                            color: DarkMode.kPrimaryColor,
                          )
                  ],
                ),
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
