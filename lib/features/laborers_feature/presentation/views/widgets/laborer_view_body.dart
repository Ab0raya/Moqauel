import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/laborers_feature/presentation/controller/laborer_cubit/laborer_cubit.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/add_laborer_form.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/laborers_list.dart';
import '../../../../../core/utils/styles.dart';
import 'add_laborer_button.dart';

class LaborerViewBody extends StatelessWidget {
  const LaborerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaborerCubit, LaborerState>(
      builder: (context, state) {
        final laborerCubit = BlocProvider.of<LaborerCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        AddLaborerButton(onTap: () {
                          buildLaborerDialog(context);
                        }),
                      ],
                    ),
                    18.sh,
                    Text(
                      laborerCubit.date,
                      style: Styles.textStyle24.copyWith(
                        fontSize: 55,
                        color: DarkMode.kPrimaryColor,
                      ),
                    ),
                    18.sh,
                  ],
                ),
              ),
              const LaborerList(),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> buildLaborerDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const AddLaborerForm(),
        );
      },
    );
  }
}
