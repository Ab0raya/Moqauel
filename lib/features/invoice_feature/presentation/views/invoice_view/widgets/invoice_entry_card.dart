import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/spacing.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/media_query.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';

class InvoiceEntryCard extends StatelessWidget {
  final int index;
  final TextEditingController serviceController;
  final TextEditingController priceController;
  final TextEditingController detailsController;

  const InvoiceEntryCard({super.key,
    required this.index,
    required this.serviceController,
    required this.priceController,
    required this.detailsController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context) * 0.28,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: DarkMode.kPrimaryColor,
        ),
      ),
      child: Column(
        children: [
          Text(
            '${index + 1}',
            style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
          ),
          10.sh,
          CustomTextFormField(
            hint: 'الخدمة',
            icon: CupertinoIcons.wrench_fill,
            controller: serviceController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك ادخل التفاصيل';
              }
              return null;
            },
          ),
          5.sh,
          CustomTextFormField(
            textInputType: TextInputType.number,
            hint: 'السعر',
            icon: Icons.price_change,
            controller: priceController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك ادخل التفاصيل';
              }
              return null;
            },
          ),
          5.sh,
          CustomTextFormField(
            hint: 'التفاصيل',
            icon: Icons.extension_rounded,
            controller: detailsController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك ادخل التفاصيل';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}