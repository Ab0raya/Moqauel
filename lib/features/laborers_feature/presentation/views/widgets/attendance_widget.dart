import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/features/laborers_feature/presentation/controller/attendance_cubit/attendance_cubit.dart';
import 'package:shoghl/constants/colors.dart';
import 'package:shoghl/constants/media_query.dart';
import '../../../data/attendance_model.dart';
import '../../controller/attendance_cubit/attendance_state.dart';
import 'attendance_item.dart';

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({
    super.key,
   
    required this.laborerId,
  });

 
  final int laborerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
  builder: (context, state) {
    final cubit = BlocProvider.of<AttendanceCubit>(context);
    return FutureBuilder<bool>(
      future: cubit.checkLaborerAttendanceForToday(laborerId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildAttendanceWidget(snapshot, context);
        } else {
          return const SizedBox();
        }
      },
    );
  },
);
  }

  Visibility buildAttendanceWidget(AsyncSnapshot<bool> snapshot, BuildContext context) {
    return Visibility(
    visible: snapshot.data == true ? false : true,
      child: Column(
        children: [
          15.sh,
          Row(
            children: [
              Container(
                height: getScreenHeight(context) * 0.047,
                width: getScreenWidth(context) * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: DarkMode.kBgColor,
                ),
                child: BlocBuilder<AttendanceCubit, AttendanceState>(
                  builder: (context, state) {
                    return Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        AttendanceItem(
                          itemIndex: 0,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(30),
                          ),
                          onTap: () {
                            context.read<AttendanceCubit>().changeCurrentIndex(0);
                          },
                          text: 'حضور',
                          currentIndex: context.read<AttendanceCubit>().currentIndex,
                        ),
                        AttendanceItem(
                          itemIndex: 1,
                          onTap: () {
                            context.read<AttendanceCubit>().changeCurrentIndex(1);
                          },
                          text: 'غياب',
                          currentIndex: context.read<AttendanceCubit>().currentIndex,
                        ),
                        AttendanceItem(
                          itemIndex: 2,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(30)),
                          onTap: () {
                            context.read<AttendanceCubit>().changeCurrentIndex(2);
                          },
                          text: 'نصف يوم',
                          currentIndex: context.read<AttendanceCubit>().currentIndex,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  String status = context.read<AttendanceCubit>().getStatusFromIndex();
                  Attendance attendance = Attendance(date: DateTime.now().toIso8601String(), status: status);
                  context.read<AttendanceCubit>().addAttendance(laborerId, attendance);
                },
                icon: const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: DarkMode.kPrimaryColor,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
