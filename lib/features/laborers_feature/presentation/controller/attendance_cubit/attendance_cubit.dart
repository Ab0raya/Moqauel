import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/SQlite/local_database/local_db.dart';
import '../../../data/attendance_model.dart';
import 'attendance_state.dart';
import 'package:intl/intl.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  LocalDatabase db = LocalDatabase();
  String getStatusFromIndex() {
    switch (currentIndex) {
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

  int _currentIndex = 4;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    emit(AttendanceChanged(newIndex));
  }

  Future<void> addAttendance(int laborerId, Attendance attendance) async {
    try {
      LocalDatabase db = LocalDatabase();
      await db.addAttendance(laborerId: laborerId, attendance: attendance);
      emit(AttendanceAdded());
    } catch (e) {
      emit(const AttendanceError());
    }
  }

  Future<void> fetchAttendance(int laborerId) async {
    emit(AttendanceLoading());
    try {
      LocalDatabase db = LocalDatabase();
      List<Map<String, dynamic>> attendanceData = await db.getAttendanceData(laborerId: laborerId);
      List<Attendance> attendanceList = attendanceData.map((data) => Attendance.fromMap(data)).toList();
      emit(AttendanceLoaded(attendanceList));
    } catch (e) {
      emit(AttendanceError());
    }
  }


  Future<bool> checkLaborerAttendanceForToday(int laborerId) async {
    List<Map<String, dynamic>> attendanceData = await db.getAttendanceData(laborerId: laborerId);
    String lastAttendedDay = attendanceData[attendanceData.length-1]['date'];
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    bool attendanceExists = lastAttendedDay.contains(today);
    return attendanceExists;
  }


}
