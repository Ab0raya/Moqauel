import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';

import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../generated/l10n.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({super.key, required this.delete, required this.msg});
  final Function() delete;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              msg,
              style:
                  Styles.textStyle22.copyWith(color: DarkMode.kPrimaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomMaterialButton(
                  label: S.of(context).yes,
                  onTap: delete,
                  height: 50,
                  width: 10,
                  labelStyle: Styles.textStyle18,
                ),
                SizedBox(width: getScreenWidth(context)*0.04,),
                CustomMaterialButton(
                  label: S.of(context).no,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  height: 50,
                  width: 10,
                  labelStyle: Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor),
                  bgColor: DarkMode.kWhiteColor.withOpacity(0.25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> buildDeleteAccountDialog(BuildContext context,Function() delete) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: DeleteAlert(
          msg: S.of(context).confirmDelete,
          delete: delete,
        ),
      );
      // return const ;
    },
  );
}

Future<dynamic> buildDeleteArchiveDialog(BuildContext context,Function() delete) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: DeleteAlert(
          msg:  S.of(context).confirmDelete,
          delete: delete,
        ),
      );
      // return const ;
    },
  );
}
