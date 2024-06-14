import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/features/invoice_feature/data/models/invoice.dart';
import 'package:shoghl/features/invoice_feature/data/services/pdf_generation/invoice_pdf_page_style.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class InvoicePdfPreviewView extends StatelessWidget {
  const InvoicePdfPreviewView({
    Key? key,
    required this.invoicePdf,
  }) : super(key: key);
  final InvoicePdf invoicePdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode.kBgColor,
      appBar: AppBar(
        backgroundColor: DarkMode.kBgColor,
        centerTitle: true,
        title: Text(
          'مراجعة ملف الـ PDF',
          style: Styles.textStyle24.copyWith(
            color: DarkMode.kPrimaryColor,
          ),
        ),
        actions: [IconButton(
          icon: Icon(CupertinoIcons.forward,color: DarkMode.kPrimaryColor,size: 27,),
          onPressed: (){
            context.go(AppRouter.homeViewPath);
          },
        ),]
      ),
      body: Column(
        children: [
          (getScreenHeight(context) * 0.06).sh,
          SizedBox(
            width: getScreenWidth(context),
            height: getScreenHeight(context) * 0.6,
            child: PdfPreview(
              actionBarTheme: const PdfActionBarTheme(
                elevation: 0,
                iconColor: DarkMode.kPrimaryColor,
                backgroundColor: Colors.transparent,
                actionSpacing: 0,
                alignment: WrapAlignment.center,
              ),
              shareActionExtraSubject:
                  'msa bos 3la el shareActionExtraSubject ya aburaya',
              shareActionExtraBody:
                  'msa bos 3la el shareActionExtraBody ya aburaya',
              previewPageMargin: const EdgeInsets.all(0),
              actions: [
                Text(
                  'مشاركة',
                  style: Styles.textStyle24.copyWith(
                    color: DarkMode.kPrimaryColor,
                  ),
                ),
              ],
              allowPrinting: false,
              canChangeOrientation: false,
              canChangePageFormat: false,
              canDebug: false,
              pdfFileName: '${invoicePdf.fileName}.pdf',
              build: (context) => makeInvoicePdf(
                ownerName: invoicePdf.ownerName,
                location: invoicePdf.location,
                invoices: invoicePdf.invoices,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
