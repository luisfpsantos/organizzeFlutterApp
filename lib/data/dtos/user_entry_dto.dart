import 'package:organizze_app/domain/entities/user_entries_entity.dart';

class UserEntryDto extends UserEntryEntity {
  UserEntryDto(
      {required int amount,
      required String category,
      required DateTime date,
      required String description,
      required String entryType,
      required String status,
      required String accountType})
      : super(
            amount: amount,
            category: category,
            date: date,
            description: description,
            entryType: entryType,
            status: status,
            accountType: accountType);

  static UserEntryDto fromMap(Map<String, dynamic> map) {
    return UserEntryDto(
        amount: map['amount'],
        category: map['category'],
        date: map['date'],
        description: map['description'],
        entryType: map['entryType'],
        status: map['status'],
        accountType: map['accountType']);
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'entryType': entryType,
      'date': date,
      'amount': amount,
      'category': category,
      'status': status
    };
  }
}
