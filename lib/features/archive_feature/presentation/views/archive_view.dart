import 'package:flutter/material.dart';
import 'package:shoghl/features/archive_feature/presentation/views/widgets/archive_view_body.dart';

import '../../../../constants/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/l10n.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkMode.kBgColor,
      appBar: AppBar(
        backgroundColor: DarkMode.kBgColor,
        centerTitle: true,
        title: Text(
          S.of(context).archive,
          style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor,),
        ),
      ),
      body: const ArchiveViewBody(),
    );
  }
}
