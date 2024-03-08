class Account {
  String ownerName;
  String locationName;
  String lastEdit;
  int totalIncome;
  int totalExpenses;

  Account({
    required this.ownerName,
    required this.locationName,
    required this.lastEdit,
    required this.totalIncome,
    required this.totalExpenses,
  });


  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      ownerName: map['ownerName'],
      locationName: map['locationName'],
      lastEdit: map['lastEdit'],
      totalIncome: map['totalIncome'],
      totalExpenses: map['totalExpenses'],
    );
  }
}