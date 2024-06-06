import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/laborer_view_body.dart';

class LaborersView extends StatelessWidget {
  const LaborersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الأفراد',style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),),
      ),
      body: const LaborerViewBody(),
    );
  }
}
