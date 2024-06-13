import '../../../data/attendance_model.dart';

abstract class AttendanceState {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final List<Attendance> attendanceList;
  final int totalAttendance;
  final int totalAbsent;
  final int totalHalfDays;

  const AttendanceLoaded(
      this.attendanceList,
      this.totalAttendance,
      this.totalAbsent,
      this.totalHalfDays,
      );

  @override
  List<Object> get props =>
      [attendanceList, totalAttendance, totalAbsent, totalHalfDays];
}

class AttendanceError extends AttendanceState {
  final String message;

  const AttendanceError([this.message = "An error occurred"]);

  @override
  List<Object> get props => [message];
}

class AttendanceAdded extends AttendanceState {}

class AttendanceChanged extends AttendanceState {
  final int newIndex;

  const AttendanceChanged(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
