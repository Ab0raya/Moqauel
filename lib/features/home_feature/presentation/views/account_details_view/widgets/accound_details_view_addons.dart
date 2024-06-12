import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/core/utils/widgets/custom_material_button.dart';
import 'package:shoghl/core/utils/widgets/glass_container.dart';
import 'package:shoghl/core/utils/widgets/text_form_field.dart';
import 'package:shoghl/features/home_feature/data/model/pdf_model.dart';
import 'package:shoghl/features/home_feature/data/model/treatment_model.dart';
import 'bottom_sheet_body.dart';


class AccountDetailsViewAddons {
  final Map<String, dynamic> accountData;

  AccountDetailsViewAddons({required this.accountData});

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetBody(
          accId: accountData['accountId'],
        );
      },
    );
  }
  var formKey = GlobalKey<FormState>();

  Future<dynamic> buildTreatmentDialog(
      {required BuildContext context, required Treatment treatmentData}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: GlassContainer(
            verticalPadding: 30,
            horizontalPadding: 30,
            height: getScreenHeight(context) * 0.5,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  treatmentData.title,
                  style: Styles.textStyle37
                      .copyWith(color: DarkMode.kPrimaryColor),
                ),
                Text(
                  treatmentData.details,
                  style: Styles.textStyle24,
                ),
                Text(
                  treatmentData.isIncome
                      ? 'وارد'
                      : 'مدفوع' '   ${treatmentData.cost} ',
                  style: Styles.textStyle22
                      .copyWith(color: DarkMode.kPrimaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> buildGeneratePdfDialog({
    required BuildContext context,
    required int accountId,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final pdfNameController = TextEditingController();
        return Form(
          key: formKey,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: GlassContainer(
              verticalPadding: 30,
              horizontalPadding: 30,
              height: getScreenHeight(context) * 0.25,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hint: 'أسم ملف الـ PDF',
                      icon: CupertinoIcons.doc_text_fill,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجي إدخال أسم الملف';
                        } else {
                          return null;
                        }
                      },
                      controller: pdfNameController,
                    ),
                    const SizedBox(height: 30),
                    CustomMaterialButton(
                      label: 'تم',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.go(
                            AppRouter.pdfPreviewViewPath,
                            extra: Pdf(
                              ownerName: accountData['ownerName'],
                              locationName: accountData['locationName'],
                              accountId: accountId,
                              pdfFileName: pdfNameController.text,
                            ),
                          );
                        }
                      },
                      height: 50,
                      width: 10,
                      labelStyle: Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor),
                      bgColor: Colors.white.withOpacity(0.25),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
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
          style: Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
        ),
      ],
    );
  }
}
