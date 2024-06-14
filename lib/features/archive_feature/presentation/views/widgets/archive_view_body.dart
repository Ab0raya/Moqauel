import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/styles.dart';
import 'package:shoghl/features/archive_feature/presentation/views/widgets/add_archive_item_form.dart';
import 'package:shoghl/features/archive_feature/presentation/views/widgets/archive_list.dart';

class ArchiveViewBody extends StatelessWidget {
  const ArchiveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextButton.icon(
                onPressed: () {
                  buildArchiveDialog(context);
                },
                icon: const Icon(
                  CupertinoIcons.add_circled_solid,
                  color: DarkMode.kPrimaryColor,
                ),
                label: Text(
                  'إضافة حقل',
                  style: Styles.textStyle18
                      .copyWith(color: DarkMode.kPrimaryColor),
                ),
              ),
            ],
          ),
          (getScreenHeight(context)*0.02).sh,
          const ArchiveList(),
          (getScreenHeight(context)*0.05).sh,
        ],
      ),
    );

  }
  Future<dynamic> buildArchiveDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const AddArchiveItemForm(),
        );
        // return const ;
      },
    );
  }
}
