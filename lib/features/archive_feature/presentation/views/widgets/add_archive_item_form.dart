import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/archive_feature/presentation/controller/archive_cubit.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';

class AddArchiveItemForm extends StatelessWidget {
  const AddArchiveItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => ArchiveCubit(),
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          final archiveCubit = BlocProvider.of<ArchiveCubit>(context);
          return GlassContainer(
            height: getScreenHeight(context) * 0.5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'إضافة عنصر للأرشيف',
                        style: Styles.textStyle24
                            .copyWith(color: DarkMode.kPrimaryColor),
                      ),
                      (getScreenHeight(context) * 0.05).sh,
                      CustomTextFormField(
                        controller: titleController,
                        hint: 'العنوان',
                        icon: CupertinoIcons.textformat_size,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجي إدخال العنوان';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getScreenHeight(context) * 0.08,
                      ),
                      CustomTextFormField(
                        controller: valueController,
                        hint: 'القيمة',
                        icon: CupertinoIcons.text_bubble_fill,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجي إدخال القيمة';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: getScreenHeight(context) * 0.03,
                      ),
                      CustomMaterialButton(
                          label: 'إضافة',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              archiveCubit.addArchive(
                                formKey: formKey,
                                title: titleController.text,
                                value: valueController.text,

                              );
                              titleController.clear();
                              valueController.clear();
                              context.pop;
                            }
                          },
                          height: 63,
                          width: getScreenWidth(context) * 0.6,
                          labelStyle: Styles.textStyle24.copyWith(
                            color: DarkMode.kBgColor,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
