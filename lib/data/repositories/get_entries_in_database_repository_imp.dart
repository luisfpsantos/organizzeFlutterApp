import 'package:organizze_app/data/datasources/get_entries_in_database_datasource.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_entries_in_database_repository.dart';

class GetEntriesInDataBaseRepositoryImp extends GetEntriesInDataBaseRepository {
  final GetEntriesInDataBaseDatasource _getEntriesInDataBaseDatasource;

  GetEntriesInDataBaseRepositoryImp(this._getEntriesInDataBaseDatasource);
  @override
  Future<Either<Exception, List<UserEntryEntity>>> call({
    required String loggedUser,
    List<Map<String, dynamic>>? query,
  }) async {
    return await _getEntriesInDataBaseDatasource(
        loggedUser: loggedUser, query: query);
  }
}
