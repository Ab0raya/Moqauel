import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/SQlite/local_database/local_db.dart';
import '../../../data/attendance_model.dart';
import 'attendance_state.dart';
import 'package:intl/intl.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  LocalDatabase db = LocalDatabase();

  int totalAttendance = 0;
  int totalHalfDays = 0;
  int totalAbsent = 0;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    emit(AttendanceChanged(newIndex));
  }

  String getStatusFromIndex() {
    switch (_currentIndex) {
      case 0:
        return 'حضور';
      case 1:
        return 'غياب';
      case 2:
        return 'نصف يوم';
      default:
        return 'حضور';
    }
  }

  Future<void> addAttendance(int laborerId, Attendance attendance) async {
    try {
      await db.addAttendance(laborerId: laborerId, attendance: attendance);
      emit(AttendanceAdded());
    } catch (e) {
      emit(const AttendanceError());
    }
  }

  Future<void> fetchAttendance(int laborerId) async {
    emit(AttendanceLoading());
    try {
      List<Map<String, dynamic>> attendanceData =
      await db.getAttendanceData(laborerId: laborerId);
      List<Attendance> attendanceList =
      attendanceData.map((data) => Attendance.fromMap(data)).toList();

      // Reset totals
      totalAttendance = 0;
      totalAbsent = 0;
      totalHalfDays = 0;

      // Calculate totals
      for (var attendance in attendanceList) {
        if (attendance.status == 'حضور') {
          totalAttendance += 1;
        } else if (attendance.status == 'غياب') {
          totalAbsent += 1;
        } else if (attendance.status == 'نصف يوم') {
          totalHalfDays += 1;
        }
      }

      emit(AttendanceLoaded(attendanceList, totalAttendance, totalAbsent, totalHalfDays));
    } catch (e) {
      emit(const AttendanceError());
    }
  }

  Future<bool> checkLaborerAttendanceForToday(int laborerId) async {
    List<Map<String, dynamic>> attendanceData =
    await db.getAttendanceData(laborerId: laborerId);
    String lastAttendedDay = attendanceData[attendanceData.length - 1]['date'];
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    bool attendanceExists = lastAttendedDay.contains(today);
    return attendanceExists;
  }
}
