import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../generated/l10n.dart';
import 'add_account_form.dart';

class AddAccountItem extends StatelessWidget {
  const AddAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            buildAccountDialog(context);
          },
          icon:   Icon(
            CupertinoIcons.person_crop_circle_badge_plus,
            color: DarkMode.kPrimaryColor(context),
            size: 30,
          ),
          label: Text(
            S.of(context).addAccount,
            style: Styles.textStyle18.copyWith(color: DarkMode.kPrimaryColor(context)),
          ),
        ),
      ],
    );
  }

  Future<dynamic> buildAccountDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const AddAccountForm(),
        );
        // return const ;
      },
    );
  }
}
