import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/add_entreis_datasource.dart';
import 'package:organizze_app/domain/repositories/add_entries_repository.dart';

class AddEntriesRepositoryImp implements AddEntriesRepository {
  final AddEntriesDatasource _addEntriesDatasource;

  AddEntriesRepositoryImp(this._addEntriesDatasource);
  @override
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> entry, String loggedUser) async {
    return await _addEntriesDatasource(entry, loggedUser);
  }
}
