import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/laborer_view_body.dart';

import '../../../../generated/l10n.dart';

class LaborersView extends StatelessWidget {
  const LaborersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: DarkMode.kBgColor,
      appBar: AppBar(
        backgroundColor: DarkMode.kBgColor,
        centerTitle: true,
        title: Text(S.of(context).laborers,style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),),
      ),
      body: const LaborerViewBody(),
    );
  }
}
