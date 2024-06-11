import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/home_feature/presentation/controller/switch_cubit/switch_cubit.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/media_query.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../../core/utils/widgets/custom_switch.dart';
import '../../../../../../core/utils/widgets/text_form_field.dart';
import '../../../controller/treatment_cubit/treatment_cubit.dart';


class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
    required this.accId,
  });

  final int accId;
  @override
  Widget build(BuildContext context) {
    final addTreatmentCubit = BlocProvider.of<TreatmentCubit>(context);
    return BlocBuilder<TreatmentCubit, TreatmentState>(
      builder: (context, state) {
        return Container(
          margin:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.all(12),
          height: getScreenHeight(context) * 0.55,
          decoration: buildBoxDecoration(),
          child: Center(
            child: Form(
              key: addTreatmentCubit.formKey,
              child: Column(
                children: [
                  Container(
                    width: getScreenWidth(context) * 0.3,
                    height: 9,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.24),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.05,
                  ),
                  CustomTextFormField(
                    hint: 'المعاملة',
                    icon: CupertinoIcons.wrench_fill,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'يرجى إدخال المعاملة';
                      }
                      return null;
                    },
                    controller: addTreatmentCubit.treatment,
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.03,
                  ),
                  CustomTextFormField(
                    hint: 'تفاصيل (إختياري)',
                    icon: CupertinoIcons.info,
                    controller: addTreatmentCubit.details,
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.03,
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.number,
                    hint: 'التكلفة',
                    icon: CupertinoIcons.money_dollar_circle_fill,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'يرجى إدخال التكلفة';
                      }
                      if (int.tryParse(val) == null) {
                        return 'الرجاء إدخال قيمة رقمية صحيحة';
                      }
                      return null;
                    },
                    controller: addTreatmentCubit.cost,
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.05,
                  ),
                  BlocBuilder<SwitchCubit, SwitchState>(
                    builder: (context, state) {
                      final switchCubit = BlocProvider.of<SwitchCubit>(context);
                      print('${switchCubit.isIncome}');
                      return CustomSwitch(
                        isIncome: switchCubit.isIncome,
                        change: (val) {
                          switchCubit.changeValue(val: val);
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<SwitchCubit, SwitchState>(
                    builder: (context, state) {
                      final switchCubit = BlocProvider.of<SwitchCubit>(context);
                      return CustomMaterialButton(
                        label: 'إنهاء',
                        onTap: () {
                          if (addTreatmentCubit.formKey.currentState!
                              .validate()) {
                            addTreatmentCubit.addTreatment(
                              title: addTreatmentCubit.treatment.text,
                              time: addTreatmentCubit.hour,
                              details: addTreatmentCubit.details.text,
                              cost: int.parse(addTreatmentCubit.cost.text),
                              isIncome: !switchCubit.isIncome,
                              accId: accId,
                            );
                            addTreatmentCubit.treatment.clear();
                            addTreatmentCubit.details.clear();
                            addTreatmentCubit.cost.clear();
                            Navigator.of(context).pop();
                          }
                        },
                        height: 63,
                        width: getScreenWidth(context) * 0.8,
                        labelStyle: Styles.textStyle24,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color: DarkMode.kBgColor,
          boxShadow: [
            BoxShadow(
              color: DarkMode.kPrimaryColor.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 21.3,
              offset: const Offset(0, -4),
            )
          ],
        );
  }
}
