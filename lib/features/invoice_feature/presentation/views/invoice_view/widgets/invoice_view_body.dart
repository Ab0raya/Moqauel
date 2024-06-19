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

class InvoiceViewBody extends StatefulWidget {
  const InvoiceViewBody({super.key});

  @override
  _InvoiceViewBodyState createState() => _InvoiceViewBodyState();
}

class _InvoiceViewBodyState extends State<InvoiceViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvoiceCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<InvoiceCubit, InvoiceState>(
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            });
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomMaterialButton(
                        label: 'إضافة حقل',
                        onTap: () => context.read<InvoiceCubit>().addCard(),
                        height: 60,
                        width: getScreenWidth(context) * 0.5,
                        labelStyle: Styles.textStyle24,
                      ),
                      CustomMaterialButton(
                        label: 'PDF',
                        onTap: () {
                          context.read<InvoiceCubit>().generateInvoices();
                          final invoices = context.read<InvoiceCubit>().state.invoices;
                          buildPdfDialog(context: context, invoices: invoices);
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
                    controller: _scrollController,
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
      },
    );
  }
}
