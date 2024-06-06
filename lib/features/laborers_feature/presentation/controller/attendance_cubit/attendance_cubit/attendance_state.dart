abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceChanged extends AttendanceState {
  final int currentIndex;

  AttendanceChanged(this.currentIndex);
}
