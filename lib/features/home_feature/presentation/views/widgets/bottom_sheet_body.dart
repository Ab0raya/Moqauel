import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/text_form_field.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_material_button.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    TextEditingController treatment = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(12),
      height: getScreenHeight(context) * 0.55,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24)),
          color: DarkMode.kBgColor,
          boxShadow: [
            BoxShadow(
              color:
              DarkMode.kPrimaryColor.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 21.3,
              offset: const Offset(0, -4),
            )
          ]),
      child: Center(
        child: Column(
          children: [
            Container(
              width: getScreenWidth(context) * 0.3,
              height: 9,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.24),
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.05,
            ),
            CustomTextFormField(
              hint: 'المعاملة',
              icon: CupertinoIcons.wrench_fill,
              validator: (val) {
                return null;
              },
              controller: treatment,
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.03,
            ),
            CustomTextFormField(
              hint: 'تفاصيل (إختياري)',
              icon: CupertinoIcons.info,
              validator: (val) {
                return null;
              },
              controller: treatment,
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.03,
            ),
            CustomTextFormField(
              hint: 'التكلفة',
              icon: CupertinoIcons.money_dollar_circle_fill,
              validator: (val) {
                return null;
              },
              controller: treatment,
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    'وارد',
                    style: Styles.headingTextStyle.copyWith(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  Radio(
                      value: false,
                      groupValue: (),
                      onChanged: (va) {}),
                  const Spacer(),
                  Text(
                    'مدفوع',
                    style: Styles.headingTextStyle.copyWith(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  Radio(
                      value: false,
                      groupValue: (),
                      onChanged: (va) {}),
                ],
              ),
            ),
            const Spacer(),
            CustomMaterialButton(
              label: 'إنهاء',
              onTap: () {},
              height: 63,
              width: getScreenWidth(context) * 0.8,
              labelStyle: Styles.headingTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
