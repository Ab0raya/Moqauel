import 'dart:math';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:shoghl/constants/assets.dart';
import '../../../features/home_feature/data/model/pdf_model.dart';

Future<Uint8List> makePdf({required Pdf pdfData , required List<Map<String, dynamic>> treatments}) async {
  final pdf = pw.Document(
    title: 'how who',
  );

  final fontData = await rootBundle.load(AssetsPaths.fontPath);
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());
  const PdfColor bg = PdfColor.fromInt(0xff161616);
  const PdfColor green = PdfColor.fromInt(0xffD2F446);
  var date = DateTime.now().toString().substring(0, 10);
  final jsonData = treatments;
  int totalIncome = jsonData[0]['totalIncome'] as int;
  int totalExpenses = jsonData[1]['totalExpenses'] as int;
  List<dynamic> treatmentData = jsonData[2]['treatmentData'] as List<dynamic>;

  void addPageWithTreatments(List<dynamic> treatments) {
    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          theme: pw.ThemeData(
            defaultTextStyle: const pw.TextStyle(color: PdfColors.white),
          ),
          buildBackground: (pw.Context context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Container(
                decoration: const pw.BoxDecoration(
                  color: bg,
                  border: pw.Border.fromBorderSide(
                    pw.BorderSide(
                      color: green,
                      width: 10,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Center(
                child: pw.Text(
                  pdfData.ownerName,
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 40,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textDirection: pw.TextDirection.rtl,
                ),
              ),
              pw.Center(
                child: pw.Text(
                  pdfData.locationName,
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 32,
                    fontWeight: pw.FontWeight.bold,
                    color: green,
                  ),
                  textDirection: pw.TextDirection.rtl,
                ),
              ),
              pw.SizedBox(height: 50),
              pw.Table(
                border: pw.TableBorder.all(color: green),
                columnWidths: {
                  0: const pw.FlexColumnWidth(0.6),
                  1: const pw.FlexColumnWidth(0.3),
                  2: const pw.FlexColumnWidth(0.3),
                },
                children: [
                  pw.TableRow(
                    decoration: pw.BoxDecoration(color: green),
                    children: [
                      pw.Center(
                        child: pw.Text(
                          "الوصف",
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: bg,
                          ),
                          textDirection: pw.TextDirection.rtl,
                        ),
                      ),
                      pw.Center(
                        child: pw.Text(
                          "التكلفة",
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: bg,
                          ),
                          textDirection: pw.TextDirection.rtl,
                        ),
                      ),
                      pw.Center(
                        child: pw.Text(
                          "الخدمة او السلعة",
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: bg,
                          ),
                          textDirection: pw.TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  ...treatments.map((treatment) {
                    return pw.TableRow(
                      children: [
                        pw.Center(
                          child: pw.Text(
                            treatment['details'] ?? '',
                            style: pw.TextStyle(font: ttf, fontSize: 14),
                            textDirection: pw.TextDirection.rtl,
                          ),
                        ),
                        pw.Center(
                          child: pw.Text(
                            treatment['cost'].toString(),
                            style: pw.TextStyle(font: ttf, fontSize: 14),
                          ),
                        ),
                        pw.Center(
                          child: pw.Text(
                            treatment['title'],
                            style: pw.TextStyle(font: ttf, fontSize: 14),
                            textDirection: pw.TextDirection.rtl,
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ],
              ),
              pw.Spacer(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    children: [
                      pw.Text(
                        "تاريخ",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 30,
                          fontWeight: pw.FontWeight.bold,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                      pw.Text(
                        date,
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 28,
                          fontWeight: pw.FontWeight.bold,
                          color: green,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        "المتعاهد",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 30,
                          fontWeight: pw.FontWeight.bold,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                      pw.Text(
                        'الحاج سيد',
                        style: pw.TextStyle(
                            font: ttf,
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold,
                            color: green),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  for (var i = 0; i < treatmentData.length; i += 9) {
    addPageWithTreatments(treatmentData.sublist(i, min(i + 9, treatmentData.length)));
  }

  pdf.addPage(
    pw.Page(
      pageTheme: pw.PageTheme(
        theme: pw.ThemeData(
          defaultTextStyle: const pw.TextStyle(color: PdfColors.white),
        ),
        buildBackground: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              decoration: const pw.BoxDecoration(
                color: bg,
                border: pw.Border.fromBorderSide(
                  pw.BorderSide(
                    color: green,
                    width: 10,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Table(
              border: pw.TableBorder.all(color: green),
              columnWidths: {
                0: const pw.FlexColumnWidth(5),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
              },
              children: [
                pw.TableRow(
                  children: [
                    pw.SizedBox(),
                    pw.Center(
                      child: pw.Text(
                        totalExpenses.toString(),
                        style: pw.TextStyle(
                          color: green,
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "إجمالي المصروفات",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: green,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.SizedBox(),
                    pw.Center(
                      child: pw.Text(
                        totalIncome.toString(),
                        style: pw.TextStyle(
                          color: green,
                          font: ttf,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    pw.Center(
                      child: pw.Text(
                        "إجمالي الدخل",
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: green,
                        ),
                        textDirection: pw.TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.Spacer(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  children: [
                    pw.Text(
                      "تاريخ",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 30,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                    pw.Text(
                      date,
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: green,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      "المتعاهد",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 30,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                    pw.Text(
                      'الحاج سيد',
                      style: pw.TextStyle(
                          font: ttf,
                          fontSize: 30,
                          fontWeight: pw.FontWeight.bold,
                          color: green),
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
