class Laborer {
  final String name;
  final String addingDate;

  Laborer({
    required this.addingDate,
    required this.name,
  });

  factory Laborer.fromMap(Map<String, dynamic> map) {
    return Laborer(
      addingDate: map['addingDate'],
      name: map['name'],
    );
  }
}