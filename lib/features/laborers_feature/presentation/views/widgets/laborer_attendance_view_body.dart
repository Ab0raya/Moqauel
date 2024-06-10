import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoghl/constants/spacing.dart';

import '../../../../../constants/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../controller/attendance_cubit/attendance_cubit.dart';
import '../../controller/attendance_cubit/attendance_state.dart';
import '../../controller/laborer_cubit/laborer_cubit.dart';

class LaborerAttendanceViewBody extends StatelessWidget {
  const LaborerAttendanceViewBody({
    super.key,
    required this.laborerId,
  });

  final int laborerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaborerCubit, LaborerState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<LaborerCubit>(context);
        return FutureBuilder<String>(
          future: cubit.fetchLaborerName(laborerId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: Styles.textStyle24.copyWith(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Laborer not found',
                  style:
                  Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
                ),
              );
            } else {
              final laborerName = snapshot.data!;
              return BlocProvider(
                create: (context) =>
                AttendanceCubit()..fetchAttendance(laborerId),
                child: BlocBuilder<AttendanceCubit, AttendanceState>(
                  builder: (context, attendanceState) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            laborerName,
                            style: Styles.textStyle37
                                .copyWith(color: DarkMode.kPrimaryColor),
                          ),
                          30.sh,
                          if (attendanceState is AttendanceLoading)
                            const Center(child: CircularProgressIndicator()),
                          if (attendanceState is AttendanceLoaded)
                          Expanded(
                            child: ListView.builder(
                              itemCount: attendanceState.attendanceList
                                  .length,
                              itemBuilder: (context, index) {
                                final attendance =
                                attendanceState.attendanceList[index];
                                print(attendance.date);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(attendance.date as String,style: Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),),
                                    Text(attendance.status,style: Styles.textStyle24.copyWith(fontWeight: FontWeight.normal),),
                                  ],

                                );
                              },
                            ),
                          ),

                          if (attendanceState is AttendanceError)
                            Center(
                              child: Text(
                                attendanceState.message,
                                style: Styles.textStyle24
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}


