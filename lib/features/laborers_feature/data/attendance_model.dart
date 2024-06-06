class Attendance {
  final String date;
  final String status;

  Attendance({required this.date, required this.status});

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      date: map['date'],
      status: map['status'],
    );
  }
}