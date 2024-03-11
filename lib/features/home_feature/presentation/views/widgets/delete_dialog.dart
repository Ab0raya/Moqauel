import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/custom_material_button.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/glass_container.dart';

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({super.key, required this.delete});
  final Function() delete;

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
              'متأكد من حذف الحساب ؟',
              style:
                  Styles.titleTextStyle.copyWith(color: DarkMode.kPrimaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomMaterialButton(
                  label: 'نـعم',
                  onTap: delete,
                  height: 50,
                  width: 10,
                  labelStyle: Styles.textStyle18,
                ),
                SizedBox(width: getScreenWidth(context)*0.04,),
                CustomMaterialButton(
                  label: 'لا',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  height: 50,
                  width: 10,
                  labelStyle: Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor),
                  bgColor: Colors.white.withOpacity(0.25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> buildDeleteDialog(BuildContext context,Function() delete) {
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
          delete: delete,
        ),
      );
      // return const ;
    },
  );
}
