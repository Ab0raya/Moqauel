import 'package:meta/meta.dart';
import '../../../data/attendance_model.dart';

@immutable
sealed class AttendanceState {
  const AttendanceState();

  List<Object> get props => [];
}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceChanged extends AttendanceState {
  final int currentIndex;

  const AttendanceChanged(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

final class AttendanceAdded extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceLoaded extends AttendanceState {
  final List<Attendance> attendanceList;

  const AttendanceLoaded(this.attendanceList);

  @override
  List<Object> get props => [attendanceList];
}

final class AttendanceError extends AttendanceState {
  final String message;

  const AttendanceError([this.message = "An error occurred"]);

  @override
  List<Object> get props => [message];
}

class AttendanceVisibilityChanged extends AttendanceState {
  final bool isVisible;

  const AttendanceVisibilityChanged(this.isVisible);

}