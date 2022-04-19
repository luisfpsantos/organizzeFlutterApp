import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_entries_in_database_datasource.dart';
import 'package:organizze_app/data/dtos/user_entry_dto.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';
import 'package:organizze_app/domain/errors/get_entries_in_database_errors.dart';

class GetEntriesInDataBaseDatasourceImp
    implements GetEntriesInDataBaseDatasource {
  @override
  Future<Either<Exception, List<UserEntryEntity>>> call({
    required String loggedUser,
    required String accountType,
    List<Map<String, dynamic>>? query,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    List<UserEntryEntity> userEntries = [];

    try {
      var user = await users.where('user', isEqualTo: loggedUser).get();

      CollectionReference collectionEntries = FirebaseFirestore.instance
          .collection('users/${user.docs[0].id}/entries');

      Query _query = collectionEntries
          .orderBy('date', descending: false)
          .where('accountType', isEqualTo: accountType);

      if (query != null) {
        for (var q in query) {
          _query = _query.where(q['field'], isEqualTo: q['value']);
        }
      }

      QuerySnapshot _entries = await _query.get();

      if (_entries.docs.isEmpty) {
        return left(NoEntriesFound());
      }

      for (var entry in _entries.docs) {
        userEntries.add(
          UserEntryDto(
            amount: entry['amount'],
            category: entry['category'],
            date: (entry['date'] as Timestamp).toDate(),
            description: entry['description'],
            entryType: entry['entryType'],
            status: entry['status'],
            accountType: entry['accountType'],
          ),
        );
      }
      return right(userEntries);
    } catch (e) {
      return left(GetEntriesInDatabaseDatasourceError());
    }
  }
}
