import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/services/pdf_generation_service/pdf_page_style.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/data/model/pdf_model.dart';
import 'package:shoghl/features/home_feature/presentation/controller/treatment_cubit/treatment_cubit.dart';

class PdfPreviewView extends StatelessWidget {
  const PdfPreviewView({Key? key, required this.pdf}) : super(key: key);
  final Pdf pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode.kBgColor,
      appBar: AppBar(
        backgroundColor: DarkMode.kBgColor,
        title: Text(
          'معاينة ملف الـ PDF',
          style: Styles.textStyle20.copyWith(color: DarkMode.kPrimaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go(AppRouter.homeViewPath);
            },
            icon: const Icon(
              CupertinoIcons.forward,
              color: DarkMode.kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<TreatmentCubit, TreatmentState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<TreatmentCubit>(context);

            return FutureBuilder<List<Map<String, dynamic>>>(
              future: cubit.fetchAllData(accId: pdf.accountId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show a loading indicator while waiting
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Handle error state
                } else if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Container(
                    width: getScreenWidth(context) * 1,
                    height: getScreenHeight(context) * 0.7,
                    color: Colors.red,
                    child: PdfPreview(
                      actionBarTheme: const PdfActionBarTheme(
                        elevation: 0,
                        iconColor: DarkMode.kPrimaryColor,
                        backgroundColor: DarkMode.kBgColor,
                        actionSpacing: 0,
                        alignment: WrapAlignment.center,
                      ),
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
                      pdfFileName: '${pdf.pdfFileName}.pdf',
                      build: (context) => makePdf(pdfData: pdf),
                    ),
                  );
                } else {
                  return const Text('لايتوفر PDF لعرضه'); // Handle case when no data is returned
                }
              },
            );
          },
        ),
      ),
    );
  }
}
