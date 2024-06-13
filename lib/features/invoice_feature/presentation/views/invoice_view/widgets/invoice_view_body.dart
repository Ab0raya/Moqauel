import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/invoice_feature/presentation/views/invoice_view/widgets/generate_pdf_form.dart';
import 'package:shoghl/features/invoice_feature/presentation/views/invoice_view/widgets/invoice_entry_card.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../data/models/invoice.dart';
import '../../../controller/invoice_cubit.dart';
import '../../../controller/invoice_state.dart';

class InvoiceViewBody extends StatelessWidget {
  const InvoiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvoiceCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<InvoiceCubit, InvoiceState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMaterialButton(
                        label: 'إضافة حقل',
                        onTap: () => context.read<InvoiceCubit>().addCard(),
                        height: 60,
                        width: getScreenWidth(context) * 0.6,
                        labelStyle: Styles.textStyle24,
                      ),
                      CustomMaterialButton(
                        label: 'PDF',
                        onTap: () {
                          context.read<InvoiceCubit>().generateInvoices();
                        final invoices =
                            context.read<InvoiceCubit>().state.invoices;
                          buildPdfDialog(context: context,invoices: invoices);
                        },
                        height: 60,
                        width: getScreenWidth(context) * 0.3,
                        labelStyle: Styles.textStyle24,
                        child: Row(
                          children: [
                            const Text('PDF', style: Styles.textStyle24),
                            10.sh,
                            const Icon(CupertinoIcons.share_solid),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cardsCount,
                    itemBuilder: (context, index) {
                      return InvoiceEntryCard(
                        index: index,
                        serviceController: state.serviceTextControllers[index],
                        priceController: state.priceTextControllers[index],
                        detailsController: state.detailsTextControllers[index],
                      );
                    },
                  ),
                ),
                (getScreenHeight(context) * 0.06).sh,
              ],
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> buildPdfDialog({required BuildContext context, required List<Invoice> invoices}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: GeneratePdfForm(invoiceList: invoices,),
        );
        // return const ;
      },
    );
  }
}


