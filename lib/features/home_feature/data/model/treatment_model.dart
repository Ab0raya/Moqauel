class Treatment {
  final String title;
  final String time;
  final String details;
  final int cost;
  final bool isIncome;

  Treatment({
    required this.title,
    required this.time,
    required this.details,
    required this.cost,
    required this.isIncome,
  });

  factory Treatment.fromMap(Map<String, dynamic> map) {
    return Treatment(
      title: map['title'],
      time: map['time'],
      details: map['details'],
      cost: map['cost'],
      isIncome: map['isIncome'],
    );
  }
}
