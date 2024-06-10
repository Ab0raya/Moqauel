import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/core/utils/styles.dart';
import '../../controller/attendance_cubit/attendance_cubit.dart';
import 'attendance_widget.dart';

class LaborerCard extends StatelessWidget {
  const LaborerCard({
    super.key, required this.laborerId, required this.name, required this.onTap,
  });

  final int laborerId;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceCubit(),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        highlightColor: DarkMode.kPrimaryColor.withOpacity(0.05),
        splashColor: DarkMode.kPrimaryColor.withOpacity(0.05),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(13),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: DarkMode.kPrimaryColor),
            borderRadius: BorderRadius.circular(25),
            color: DarkMode.kPrimaryColor.withOpacity(0.2),
            gradient: LinearGradient(
              colors: [
                DarkMode.kPrimaryColor,
                DarkMode.kPrimaryColor.withOpacity(0.1),
                DarkMode.kPrimaryColor.withOpacity(0.0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.person_crop_circle,
                    color: DarkMode.kPrimaryColor,
                    size: 50,
                  ),
                  15.sw,
                  Text(
                    name,
                    style: Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
                  ),
                ],
              ),
              AttendanceWidget(
                laborerId: laborerId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
