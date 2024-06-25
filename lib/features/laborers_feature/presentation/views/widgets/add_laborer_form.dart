import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/media_query.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/laborers_feature/presentation/controller/laborer_cubit/laborer_cubit.dart';
import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../core/utils/widgets/glass_container.dart';
import '../../../../../core/utils/widgets/text_form_field.dart';
import '../../../../../generated/l10n.dart';

class AddLaborerForm extends StatelessWidget {
  const AddLaborerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final laborerNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<LaborerCubit, LaborerState>(
      builder: (context, state) {
        final laborerCubit = BlocProvider.of<LaborerCubit>(context);
        return GlassContainer(
          height: getScreenHeight(context) * 0.4,
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
                      S.of(context).addingLaborer,
                      style: Styles.textStyle24
                          .copyWith(color: DarkMode.kPrimaryColor(context)),
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.1,
                    ),
                    CustomTextFormField(
                      controller: laborerNameController,
                      hint: S.of(context).laborerName,
                      icon: CupertinoIcons.person_alt_circle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).laborerNameError;
                        }
                        return null;
                      },
                    ),

                    (getScreenHeight(context) * 0.08).sh,
                    CustomMaterialButton(
                        label: S.of(context).add,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            laborerCubit.addLaborer(laborerName: laborerNameController.text);
                            laborerNameController.clear();
                            Navigator.pop(context);
                          }
                        },
                        height: 63,
                        width: getScreenWidth(context) * 0.6,
                        labelStyle: Styles.textStyle24
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
