import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoghl/constants/spacing.dart';
import 'package:shoghl/core/utils/app_router.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/attendance_card.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/widgets/laborer_name.dart';
import '../../../../constants/colors.dart';
import '../../../../core/utils/styles.dart';
import '../controller/attendance_cubit/attendance_cubit.dart';
import '../controller/attendance_cubit/attendance_state.dart';
import '../controller/laborer_cubit/laborer_cubit.dart';

class LaborerAttendanceView extends StatelessWidget {
  final int laborerId;

  const LaborerAttendanceView({Key? key, required this.laborerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go(AppRouter.homeViewPath);
            },
            icon: const Icon(CupertinoIcons.forward, size: 37),
          ),
        ],
        title: IconButton(
          onPressed: () {
            context.read<LaborerCubit>().deleteLaborerWithAttendance(laborerId);
            context.go(AppRouter.homeViewPath);
          },
          icon: const Icon(CupertinoIcons.delete, color: Colors.red, size: 37),
        ),
      ),
      body: BlocBuilder<LaborerCubit, LaborerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LaborerName(laborerId: laborerId),
                30.sh,
                BlocProvider(
                  create: (context) => AttendanceCubit()..fetchAttendance(laborerId),
                  child: BlocBuilder<AttendanceCubit, AttendanceState>(
                    builder: (context, attendanceState) {
                      if (attendanceState is AttendanceLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (attendanceState is AttendanceLoaded) {
                        return Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'حضور',
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                      20.sh,
                                      Text(
                                        attendanceState.totalAttendance
                                            .toString(),
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'غياب',
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                      20.sh,
                                      Text(
                                        attendanceState.totalAbsent.toString(),
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'نصف يوم',
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                      20.sh,
                                      Text(
                                        attendanceState.totalHalfDays.toString(),
                                        style: Styles.textStyle24.copyWith(
                                            color: DarkMode.kPrimaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              20.sh,
                              Expanded(
                                child: ListView.builder(
                                  itemCount: attendanceState.attendanceList.length,
                                  itemBuilder: (context, index) {
                                    final reversedIndex = attendanceState.attendanceList.length - 1 - index;
                                    final attendance = attendanceState.attendanceList[reversedIndex];
                                    return AttendanceCard(
                                      date: attendance.date,
                                      status: attendance.status,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (attendanceState is AttendanceError) {
                        return Center(
                          child: Text(
                            attendanceState.message,
                            style: Styles.textStyle24.copyWith(color: Colors.red),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
