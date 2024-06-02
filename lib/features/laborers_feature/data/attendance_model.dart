class Attendance {
  final int? attendanceId;
  final int laborerId;
  final String date;
  final String status;

  Attendance({this.attendanceId, required this.laborerId, required this.date, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'attendanceId': attendanceId,
      'laborerId': laborerId,
      'date': date,
      'status': status,
    };
  }

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      attendanceId: map['attendanceId'],
      laborerId: map['laborerId'],
      date: map['date'],
      status: map['status'],
    );
  }
}