import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';

abstract class GetEntriesInDataBaseDatasource {
  Future<Either<Exception, List<UserEntryEntity>>> call({
    required String loggedUser,
    List<Map<String, dynamic>>? query,
  });
}
