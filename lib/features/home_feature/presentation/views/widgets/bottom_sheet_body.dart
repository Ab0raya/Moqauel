import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/features/home_feature/presentation/controller/add_treatment_cubit/add_treatment_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/controller/switch_cubit/switch_cubit.dart';
import 'package:shoghl/features/home_feature/presentation/views/widgets/text_form_field.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_material_button.dart';
import 'custom_switch.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
    required this.accId,
  });

  final int accId;

  @override
  Widget build(BuildContext context) {
    TextEditingController treatment = TextEditingController();
    TextEditingController details = TextEditingController();
    TextEditingController cost = TextEditingController();
    final addTreatmentCubit = BlocProvider.of<AddTreatmentCubit>(context);
    DateTime now = DateTime.now();
    String hour = DateFormat('hh:mm a').format(now);
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<AddTreatmentCubit, AddTreatmentState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Container(
            margin:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.all(12),
            height: getScreenHeight(context) * 0.55,
            decoration: BoxDecoration(
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
            ),
            child: Center(
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
                    controller: treatment,
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.03,
                  ),
                  CustomTextFormField(
                    hint: 'تفاصيل (إختياري)',
                    icon: CupertinoIcons.info,
                    controller: details,
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
                    controller: cost,
                  ),
                  SizedBox(
                    height: getScreenHeight(context) * 0.05,
                  ),
                  BlocBuilder<SwitchCubit, SwitchState>(
                    builder: (context, state) {
                      final switchCubit = BlocProvider.of<SwitchCubit>(context);
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
                          if (formKey.currentState!.validate()) {
                            addTreatmentCubit.addTreatment(
                              title: treatment.text,
                              time: hour,
                              details: details.text,
                              cost: int.parse(cost.text),
                              isIncome: switchCubit.isIncome,
                              accId: accId,
                            );
                            treatment.clear();
                            details.clear();
                            cost.clear();
                            Navigator.of(context).pop();
                          }
                        },
                        height: 63,
                        width: getScreenWidth(context) * 0.8,
                        labelStyle: Styles.headingTextStyle,
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
}
