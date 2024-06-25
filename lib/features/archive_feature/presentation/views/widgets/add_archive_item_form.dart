import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/archive_feature/presentation/controller/archive_cubit.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';
import '../../../../../generated/l10n.dart';

class AddArchiveItemForm extends StatelessWidget {
  const AddArchiveItemForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<ArchiveCubit, ArchiveState>(
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
                      S.of(context).addElementToArchive,
                      style: Styles.textStyle24
                          .copyWith(color: DarkMode.kPrimaryColor(context)),
                    ),
                    (getScreenHeight(context) * 0.05).sh,
                    CustomTextFormField(
                      controller: titleController,
                      hint: S.of(context).title,
                      icon: CupertinoIcons.textformat_size,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).titleError;
                        }
                        return null;
                      },
                    ),
                    10.sh,
                    CustomTextFormField(
                      controller: valueController,
                      hint: S.of(context).value,
                      icon: CupertinoIcons.text_bubble_fill,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).valueError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomMaterialButton(
                            label: S.of(context).add,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                archiveCubit.addArchive(
                                  formKey: formKey,
                                  title: titleController.text,
                                  value: valueController.text,
                                );

                                titleController.clear();
                                valueController.clear();
                                Navigator.pop(context);
                                archiveCubit.fetchArchiveData();
                              }
                            },
                            height: 63,
                            width: getScreenWidth(context) * 0.35,
                            labelStyle: Styles.textStyle24.copyWith(
                              color: DarkMode.kBgColor(context),
                            )),
                        20.sw,
                        CustomMaterialButton(
                          label: '',
                          onTap: () async {
                            archiveCubit.getGalleryImage();
                          },
                          height: 63,
                          width: getScreenWidth(context) * 0.15,
                          labelStyle: Styles.textStyle24.copyWith(
                            color: DarkMode.kBgColor(context),
                          ),
                          child: archiveCubit.isImagePicked()
                              ? const Icon(Icons.check, size: 30,)
                              : const Icon(Icons.add_photo_alternate, size: 30,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
