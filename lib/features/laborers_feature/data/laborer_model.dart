class Laborer {
  final int? laborerId;
  final String name;
  final int id;

  Laborer({this.laborerId, required this.name, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'laborerId': laborerId,
      'name': name,
      'id': id,
    };
  }

  factory Laborer.fromMap(Map<String, dynamic> map) {
    return Laborer(
      laborerId: map['laborerId'],
      name: map['name'],
      id: map['id'],
    );
  }
}