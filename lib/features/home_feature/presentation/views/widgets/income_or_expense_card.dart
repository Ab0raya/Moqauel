import 'package:flutter/cupertino.dart';
import 'package:shoghl/constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_container.dart';
import '../../../../../constants/colors.dart';

class IncomeOrExpenseCard extends StatelessWidget {
  const IncomeOrExpenseCard({super.key, required this.ownerName, required this.amount, required this.isIncome});
  final String ownerName;
  final int amount;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
      child: CustomContainer(
        height: 130,
        width: double.infinity,
        child:  Column(
          children: [
            Text(ownerName,style: Styles.titleTextStyle.copyWith(fontSize: 30,color: DarkMode.kPrimaryColor),),
            SizedBox(height: getScreenHeight(context)*0.011,),
            Row(
              children: [
                Text('إكرامية خرسانة',style: Styles.titleTextStyle.copyWith(fontSize: 20,),),
                const Spacer(),
                Text('$amount',style: Styles.titleTextStyle.copyWith(fontSize: 35,fontWeight: FontWeight.bold),),
                 isIncome? const Icon(CupertinoIcons.arrow_down_left,size: 40,color: DarkMode.kPrimaryColor,): const Icon(CupertinoIcons.arrow_up_right,size: 40,color: DarkMode.kPrimaryColor,)
              ],
            ),
          ],
        ),
        onTap: (){},
      ),
    );
  }
}
