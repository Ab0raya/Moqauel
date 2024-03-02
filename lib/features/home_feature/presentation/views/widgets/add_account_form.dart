import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/SQlite/account_database/account_db.dart';
import 'package:shoghl/features/home_feature/data/model/account_model.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/text_form_field.dart';
import 'package:shoghl/tagarob.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_material_button.dart';
import 'glass_container.dart';

class AddAccountForm extends StatelessWidget {
  const AddAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ownerNameController = TextEditingController();
    final locationController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    AccountDatabase sqlDB = AccountDatabase();

    return GlassContainer(
      height: getScreenHeight(context) * 0.55,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إضافة حساب',
                  style: Styles.headingTextStyle
                      .copyWith(color: DarkMode.kPrimaryColor),
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.1,
                ),
                CustomTextFormField(
                  controller: ownerNameController,
                  hint: 'المالك',
                  icon: CupertinoIcons.person_alt_circle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي إدخال أسم المالك';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.08,
                ),
                CustomTextFormField(
                  controller: locationController,
                  hint: 'أسم الموقع',
                  icon: CupertinoIcons.location_fill,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجي إدخال أسم الموقع';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.1,
                ),
                CustomMaterialButton(
                  label: 'إضافة',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final String ownerName = ownerNameController.text;
                      final String locationName = locationController.text;
                      final String date =
                      DateFormat.yMMMd().format(DateTime.now());
                      Account account = Account(ownerName: ownerName,
                          locationName: locationName,
                          lastEdit: date,
                          totalIncome: 0,
                          totalExpenses: 0);
                      int insert = await sqlDB.insertData(account: account);
                      List<Map> response = await sqlDB.getData();
                      ownerNameController.clear();
                      locationController.clear();
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Tagarob(accData: response)));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
