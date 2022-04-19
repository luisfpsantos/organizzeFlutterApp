class UserEntryEntity {
  final int amount;
  final String category;
  final DateTime date;
  final String description;
  final String entryType;
  final String status;
  final String accountType;

  UserEntryEntity({
    required this.amount,
    required this.category,
    required this.date,
    required this.description,
    required this.entryType,
    required this.status,
    required this.accountType,
  });
}
