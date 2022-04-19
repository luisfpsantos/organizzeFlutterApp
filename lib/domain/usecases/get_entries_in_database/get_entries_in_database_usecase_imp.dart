import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';
import 'package:organizze_app/domain/repositories/get_entries_in_database_repository.dart';
import 'package:organizze_app/domain/usecases/get_entries_in_database/get_entries_in_database_usecase.dart';

class GetEntriesInDataBaseUsecaseImp implements GetEntriesInDataBaseUsecase {
  final GetEntriesInDataBaseRepository _getEntriesInDataBaseRepository;

  GetEntriesInDataBaseUsecaseImp(this._getEntriesInDataBaseRepository);
  @override
  Future<Either<Exception, List<UserEntryEntity>>> call({
    required String loggedUser,
    required String accountType,
    List<Map<String, dynamic>>? query,
  }) async {
    return await _getEntriesInDataBaseRepository(
        accountType: accountType, loggedUser: loggedUser, query: query);
  }
}
