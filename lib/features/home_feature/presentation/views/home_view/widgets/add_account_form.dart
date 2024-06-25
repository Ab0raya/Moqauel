import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_account_cubit/add_account_cubit.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';
import '../../../../../../generated/l10n.dart';


class AddAccountForm extends StatelessWidget {
  const AddAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ownerNameController = TextEditingController();
    final locationController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<AddAccountCubit, AddAccountState>(
      builder: (context, state) {
        final addAccountCubit = BlocProvider.of<AddAccountCubit>(context);
        return GlassContainer(
          height: getScreenHeight(context) * 0.65,
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
                      S.of(context).addingAccount,
                      style: Styles.textStyle24
                          .copyWith(color: DarkMode.kPrimaryColor(context)),
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.1,
                    ),
                    CustomTextFormField(
                      controller: ownerNameController,
                      hint: S.of(context).owner,
                      icon: CupertinoIcons.person_alt_circle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).ownerError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.08,
                    ),
                    CustomTextFormField(
                      controller: locationController,
                      hint: S.of(context).location,
                      icon: CupertinoIcons.location_fill,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).locationError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.03,
                    ),
                    CustomMaterialButton(
                      label: S.of(context).add,
                      onTap: () async {
                        if (formKey.currentState!.validate()){
                          addAccountCubit.addAccount(
                            ownerName: ownerNameController.text,
                            location: locationController.text,
                            formKey: formKey,
                          );
                          ownerNameController.clear();
                          locationController.clear();
                          Navigator.pop(context);

                        }
                      }, height: 63, width: getScreenWidth(context)*0.6, labelStyle:  Styles.textStyle24
                        .copyWith(color: DarkMode.kBgColor(context),)
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
