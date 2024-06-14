import 'package:flutter/material.dart';
import 'package:shoghl/features/invoice_feature/presentation/views/invoice_view/widgets/invoice_view_body.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode.kBgColor,
      appBar: AppBar(
        backgroundColor: DarkMode.kBgColor,
        centerTitle: true,
        title: Text(
          'إنشاء فاتورة',
          style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
        ),
      ),
      body: const InvoiceViewBody(),
    );
  }
}
