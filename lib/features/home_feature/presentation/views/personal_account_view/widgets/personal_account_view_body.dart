import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/controller/language_cubit/language_cubit.dart';
import 'package:shoghl/core/utils/controller/language_cubit/language_state.dart';
import 'package:shoghl/core/utils/controller/username_cubit/username_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/property_row.dart';
import 'package:shoghl/features/home_feature/presentation/views/personal_account_view/widgets/user_name.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../constants/media_query.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';
import '../../../../../../generated/l10n.dart';
import 'account_action.dart';
import 'avatar.dart';
import 'custom_divider.dart';
import 'divider_row.dart';
import 'info_container.dart';
import 'info_tile.dart';
import 'language_icon.dart';

class PersonalAccountViewBody extends StatelessWidget {
  PersonalAccountViewBody({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Avatar(),
          20.sh,
          const UserName(),
          PropertyRow(title: S.of(context).properties),
          InfoContainer(
            height: getScreenHeight(context) * 0.1,
            children: [
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  final languageCubit = BlocProvider.of<LanguageCubit>(context);
                  return InfoTile(
                    leadingText: S.of(context).language,
                    children: [
                      LanguageIcon(
                        asset: 'assets/images/flags/egypt.png',
                        selected: languageCubit.language == 'ar',
                        onTap: () {
                          languageCubit.setArabic();
                        },
                      ),
                      10.sw,
                      LanguageIcon(
                        asset: 'assets/images/flags/united-kingdom.png',
                        selected: languageCubit.language == 'en',
                        onTap: () {
                          languageCubit.setEnglish();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          PropertyRow(title: S.of(context).myAcc),
          InfoContainer(
            height: getScreenHeight(context) * 0.2,
            children: [
              AccountAction(
                onTap: () {
                  buildEditNameDialog(context: context);
                },
                leadingText: S.of(context).editName,
                icon: CupertinoIcons.pen,
              ),
              const CustomDivider(),
              AccountAction(
                onTap: () {},
                leadingText: S.of(context).editAvatar,
                icon: CupertinoIcons.photo_camera_solid,
              ),
            ],
          ),
          const Spacer(),
          const DividerRow(),
        ],
      ),
    );
  }

  Future<dynamic> buildEditNameDialog({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final newNameController = TextEditingController();
        return Form(
          key: formKey,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: GlassContainer(
              verticalPadding: 30,
              horizontalPadding: 30,
              height: getScreenHeight(context) * 0.21,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hint: S.of(context).newName,
                      icon: CupertinoIcons.person_crop_circle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).noName;
                        } else {
                          return null;
                        }
                      },
                      controller: newNameController,
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<UsernameCubit, UsernameState>(
                      builder: (context, state) {
                        final cubit = BlocProvider.of<UsernameCubit>(context);
                        return CustomMaterialButton(
                          label: S.of(context).done,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final userId = await cubit.getID();
                              cubit.editUsername(
                                newUsername: newNameController.text,
                                userId: userId,
                              );
                              // Close the dialog after the username is updated
                              Navigator.of(context).pop();
                            }
                          },
                          height: 50,
                          width: 10,
                          labelStyle: Styles.textStyle18
                              .copyWith(color: DarkMode.kPrimaryColor(context)),
                          bgColor:
                          DarkMode.kWhiteColor(context).withOpacity(0.25),
                        );
                      },
                    )
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
