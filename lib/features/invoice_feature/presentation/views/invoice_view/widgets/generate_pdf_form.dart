import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/invoice_feature/data/models/invoice.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../constants/media_query.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';
import '../../../../../../generated/l10n.dart';

class GeneratePdfForm extends StatelessWidget {
  const GeneratePdfForm({super.key, required this.invoiceList});
  final List <Invoice> invoiceList;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController fileNameController = TextEditingController();
    TextEditingController ownerNameController = TextEditingController();
    TextEditingController locationController = TextEditingController();


        return GlassContainer(
          height: getScreenHeight(context) * 0.5,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).createPdf,
                        style: Styles.textStyle24
                            .copyWith(color: DarkMode.kPrimaryColor),
                      ),

                      (getScreenHeight(context)*0.03).sh,
                      CustomTextFormField(
                        hint: S.of(context).pdfFileName,
                        icon: CupertinoIcons.doc_text_fill,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).pdfFileNameError;
                          }else if(value.contains('.')){
                            return S.of(context).fileDotError;
                          }
                          return null;
                        },
                        controller: fileNameController,
                      ),
                      25.sh,
                      CustomTextFormField(
                        hint: S.of(context).owner,
                        icon: CupertinoIcons.person_alt,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).ownerError;
                          }
                          return null;
                        },
                        controller: ownerNameController,
                      ),
                      25.sh,
                      CustomTextFormField(
                        hint: S.of(context).location,
                        icon: CupertinoIcons.location_circle_fill,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).locationError;
                          }
                          return null;
                        },
                        controller: locationController,
                      ),
                      60.sh,
                      CustomMaterialButton(
                          label: S.of(context).create,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              context.go(
                                AppRouter.invoicePdfPreviewViewPath,
                                extra: InvoicePdf(
                                  invoices: invoiceList,
                                  fileName: fileNameController.text,
                                  ownerName: ownerNameController.text,
                                  location: locationController.text,
                                ),
                              );
                            }
                          },
                          height: 63,
                          width: getScreenWidth(context) * 0.6,
                          labelStyle: Styles.textStyle24.copyWith(
                            color: DarkMode.kBgColor,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  }
}
