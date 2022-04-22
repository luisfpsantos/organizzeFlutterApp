import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';
import 'package:organizze_app/domain/usecases/get_entries_in_database/get_entries_in_database_usecase.dart';

class AccountEntriesPageController {
  final GetEntriesInDataBaseUsecase _getEntriesInDataBaseUsecase;

  AccountEntriesPageController(this._getEntriesInDataBaseUsecase);

  Future<Either<Exception, List<UserEntryEntity>>> getEntriesInDataBase({
    required String loggedUser,
    List<Map<String, dynamic>>? query,
  }) async {
    return await _getEntriesInDataBaseUsecase(
        loggedUser: loggedUser, query: query);
  }
}
